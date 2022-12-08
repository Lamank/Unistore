from multiprocessing import context
# from turtle import delay
from typing import Optional

from django.shortcuts import redirect, render
from django.urls import reverse_lazy, reverse
from django.http import HttpRequest, HttpResponse
from django.contrib.auth.views import PasswordChangeView, LoginView
from django.core.mail import BadHeaderError
from django.template.loader import render_to_string
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_str
from django.http import HttpRequest, HttpResponse
from django.contrib.auth.views import PasswordChangeView
from django.contrib.auth.forms import PasswordChangeForm, PasswordResetForm
from django.http import HttpResponse
from django.db.models.query_utils import Q
from django.contrib.auth.tokens import default_token_generator
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login , get_user_model
from django.conf import settings
from urllib.parse import urlencode, quote_plus
from authlib.integrations.django_client import OAuth

from users.models import Order
from users.forms import CheckoutOrder, RegisterForm
from users.token import account_activation_token
from users.services.user import create_user_if_not_exist
from tasks.tasks import activation_mail, reset_password_mail
from users.services.user import create_cart_after_user_registered, get_order_details, get_user_cart
from users.forms import LoginForm
from product.models import Product


UserModel = get_user_model()

class LoginView(LoginView):
    form_class = LoginForm
    template_name = 'users/login.html'

def custom_password_reset(request):
	if request.method == "POST":
		password_reset_form = PasswordResetForm(request.POST)
		if password_reset_form.is_valid():
			data = password_reset_form.cleaned_data['email']
			user = UserModel.objects.filter(Q(email=data)).first()
			if user:
				mail_subject = "Password Reset Requested"
				email_template_name = "users/password/password_reset_email.txt"
				context = {
                "email":user.email,
                'domain':'127.0.0.1:8000',
                'site_name': 'Website',
                "uid": urlsafe_base64_encode(force_bytes(user.pk)),
                "user": user,
                'token': default_token_generator.make_token(user),
                'protocol': 'http',
                }
				message = render_to_string(email_template_name, context)
				try:
					reset_password_mail.send_reset_email_mail.delay(mail_subject, message, user.email)
				except BadHeaderError:
					return HttpResponse('Invalid header found.')
				return redirect ("/users/password-reset/done/")
			return HttpResponse("This mail is not authorized")
	password_reset_form = PasswordResetForm()
	return render(request=request, template_name="users/password/password_reset.html", context={"password_reset_form":password_reset_form})

def password_reset_complete(request):
    return render(request=request, template_name="users/password/password_reset_complete.html")

@login_required(login_url='/users/user-login/')
def wishlist(request):
    return render(request, 'users/wishlist.html')

@login_required(login_url='/users/user-login/')
def checkout(request: HttpRequest) -> HttpResponse:
    
    user = request.user
    checkout_form = CheckoutOrder(initial={'receiver': f'{user.first_name} {user.last_name}'})
    cart = get_user_cart(user.id)
    cart_items = cart.cartitem.all()
            
    
    context = {
        'form': checkout_form,
        'user': user,
        'cart': cart,
        'cart_items': cart_items,
    }
    return render(request, 'users/checkout.html', context=context)


@login_required(login_url='/users/user-login/')
def order_success(request: HttpRequest) -> HttpResponse:
    user_id = request.user.id
    order_detail = get_order_details(user_id)
    payment_choices = [('1', 'Cash on Delivery'), ('2', 'Credit Card'),('3', 'Paypall')]
    for method in payment_choices:
        if str(order_detail.payment) == method[0]:
            payment = method[1]
            break

    context = {
        'detail': order_detail,
        'payment': payment
    }

    return render(request, 'users/order_success.html', context=context)

#######################################################################################################################

def register(request: HttpRequest) -> HttpResponse:
    register_form = RegisterForm()
    if request.method == "POST":
        register_form = RegisterForm(request.POST)
        if 'username' in request.POST:
            if register_form.is_valid():
                user = register_form.save(commit=False)
                user.is_active = False
                user.save()
                # to get the domain of the current site
                current_site = get_current_site(request).domain
                mail_subject = 'Activation link has been sent to your email id'
                context = {
                    'user': user,  
                    'domain': current_site,  
                    'uid':urlsafe_base64_encode(force_bytes(user.pk)),  
                    'token':account_activation_token.make_token(user),
                    'protocol': "https" if request.is_secure() else "http",
                }
                to_email = register_form.cleaned_data['email']
                message = render_to_string('users/acc_active_email.html', context)
                activation_mail.send_activate_email_mail.delay(mail_subject=mail_subject, message=message, to_email=to_email)
                return HttpResponse(
                    f'Please <b>{user.first_name} {user.last_name}</b> confirm your email address to complete the registration.<b>Note:</b> Check your spam folder.'
                    )
    contex ={
        'form' : register_form
    }

    return render(request, 'users/register.html', context=contex)


def activate(request: HttpRequest, uidb64, token) -> HttpResponse:
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = UserModel.objects.get(pk=uid)  
    except:  
        user = None
    
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        create_cart_after_user_registered(user=user)
        
        # return HttpResponse('Thank you for your email confirmation. Now you can <a href="/users/user-login/">login your account</a>') 
        return redirect(reverse('users:user-login'))
    else:
        return HttpResponse('Activation link is invalid!') 


class PasswordsChangeView(PasswordChangeView):

    form_class = PasswordChangeForm
    success_url: Optional[str]
    success_url = reverse_lazy("core:home")


oauth = OAuth()

oauth.register(
    "auth0",
    client_id=settings.AUTH0_CLIENT_ID,
    client_secret=settings.AUTH0_CLIENT_SECRET,
    client_kwargs={
        "scope": "openid profile email",
    },
    server_metadata_url=f"https://{settings.AUTH0_DOMAIN}/.well-known/openid-configuration",
)


def login_user(request: HttpRequest) -> HttpResponse:
    return oauth.auth0.authorize_redirect(
        request, request.build_absolute_uri(reverse("users:auth-callback"))
    )


def auth_callback(request: HttpRequest) -> HttpResponse:
    user: dict = oauth.auth0.authorize_access_token(request)
    if user["userinfo"].get("given_name"):
        created_user = create_user_if_not_exist(
            first_name=user["userinfo"]["given_name"],
            last_name=user["userinfo"]["family_name"],
            email=user["userinfo"]["email"],
        )
    else:
        created_user = create_user_if_not_exist(
            first_name=user["userinfo"]["email"],
            last_name=user["userinfo"]["email"],
            email=user["userinfo"]["email"],
        )

    login(request, created_user)
    create_cart_after_user_registered(user=created_user)
    request.session["user"] = user
    return redirect(request.build_absolute_uri(reverse("core:home")))



@login_required(login_url='/users/user-login/')
def logout(request: HttpRequest) -> HttpResponse:
    request.session.clear()

    return redirect(
        f"https://{settings.AUTH0_DOMAIN}/v2/logout?"
        + urlencode(
            {
                "returnTo": request.build_absolute_uri(reverse("core:home")),
                "client_id": settings.AUTH0_CLIENT_ID,
            },
            quote_via=quote_plus,
        ),
    )


