import json

from django.shortcuts import render
from django.core.cache.backends.base import DEFAULT_TIMEOUT
from django.http.request import HttpRequest
from django.conf import settings
from django.views.decorators.cache import cache_page
from django.http.response import HttpResponse
from django.http import JsonResponse

from core.models import Subscriber
from core.forms import SubscribeToNewsletter, ContactForm
from product.services.products import get_products, get_popular_products, search_product, product_list, get_campaigns
from blog.services.blog import last_six_blogs, searched_blog
from tasks.tasks.contact_mail import send_contact_email

CACHE_TTL = getattr(settings, 'CACHE_TTL', DEFAULT_TIMEOUT)

def home(request: HttpRequest) -> HttpResponse:
    categories = get_products().values('category', 'category__name').distinct()[:3]
    object_list = product_list()
    blogs = last_six_blogs()[:2]
    popular_prods = get_popular_products()[:3]
    first_campaign = get_campaigns().filter(id=2).first()
    third_campaign = get_campaigns().filter(id=4).first()
    subscriber_form = SubscribeToNewsletter()
 

    context={
            "subscriber_form": subscriber_form, 
            "session": request.session.get("user"), 
            "pretty": json.dumps(request.session.get("user"), indent=4),
            "categories": categories,
            "product_list": object_list,
            "blogs": blogs,
            "popular_prods": popular_prods,
            "first_campaign": first_campaign,
            "third_campaign": third_campaign
            }
    return render(
        request=request, 
        template_name='core/index.html', 
        context=context,
        )

def contact(request: HttpRequest) -> HttpResponse:

    form = ContactForm()
    if "contact" in request.POST:
        print(request.POST)
        if request.method == "POST":
            form = ContactForm(request.POST)
            
            if form.is_valid():
                send_contact_email(
                    email=form.cleaned_data["mail"],
                    message=form.cleaned_data["mail"],
                )
                form.save()
                form.cleaned_data["mail"]
                form.cleaned_data["mail"]

    context = {
        "form": form
    }

    return render(request, 'core/contact.html', context=context)


@cache_page(CACHE_TTL)
def about_contact(request: HttpRequest) -> HttpResponse:
    return render(request, 'core/about_contact.html')

@cache_page(CACHE_TTL)
def faq(request: HttpRequest) -> HttpResponse:
    return render(request, 'core/faq.html')



def subscribe(request: HttpRequest):
    
    subscriber_form = SubscribeToNewsletter()
    if "email" in request.POST:
        print(request.POST)
        if request.META.get("HTTP_X_REQUESTED_WITH") == "XMLHttpRequest" and request.method == "POST":
            subscriber_form = SubscribeToNewsletter(request.POST)
        
            if subscriber_form.is_valid():
                Subscriber.objects.get_or_create(
                    email = subscriber_form.cleaned_data["email"]
                    )
                message = "Congratulation!! You subscribed successfully"
                return JsonResponse({'message': message})
            
            


def search(request: HttpRequest) -> HttpResponse:
    query = request.GET.get("query")
    if query: 
        results_for_product = search_product(data=query) 
        # results_for_blog = searched_blog(data=query)
        results = [results_for_product]
        print(results)
        return render(request, "core/search.html", {"results": results})
    return render(request, "core/search.html", {"results": ''})
