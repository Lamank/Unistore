from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, UsernameField
from users.backends import EmailBackend
from django.contrib.auth import get_user_model

User = get_user_model()


class CheckoutOrder(forms.Form):
    COUNTRY_CHOICES = [('1', 'Azerbaijan'),('2', 'Turkey'),('3', 'USA'),]
    PAYMENT_CHOICES = [('1' ,'Cash on Delivery'), ('2' , 'Credit Card'),('3', 'Paypall')]
    receiver = forms.CharField(
        max_length=40,
        label='Receiver',
        widget=forms.TextInput(attrs={"placeholder":"Example Example",  'class': "form-control", 'name':'receiver'}) 
        )
    phone = forms.CharField(
        label='Phone',
        widget=forms.TextInput(attrs={'placeholder':'+994(70)1234567',  'class': 'form-control', 'name':'phone'})
        )
    city = forms.CharField(
        label='City', 
        max_length=100, 
        widget=forms.TextInput(attrs={
            'class': "form-control", 
            'name':'city',}
            ))
    street = forms.CharField(
        label='Street', 
        max_length=200, 
        widget=forms.TextInput(attrs={
            'class': "form-control", 
            'name':'street'}
            ))
    building = forms.IntegerField(
        label='Building',
        widget=forms.NumberInput(attrs={
            'class': "form-control", 
            'name':'building', 
            'min':0}))
    zip = forms.IntegerField(
        label='Zip', 
        widget=forms.NumberInput(
            attrs={'class': "form-control", 
            'name':'zip', 
            'min':0}))
    payment = forms.ChoiceField(
        label='Payment',
        widget=forms.Select(attrs={
            'class' : 'form-control select', 
            'id':'payment', 
            'name': 'payment',
            'value': 'Cash on Delivery'}),
        choices=PAYMENT_CHOICES,
    )


class RegisterForm(UserCreationForm):

    class Meta:
        
        model = User
        fields = ["username", "email", "password1", "password2", "first_name", "last_name"]
        widgets = {
            "username": forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Username',
            }),
            "email": forms.EmailInput(attrs={
                'class': 'form-control',
                'placeholder': 'E-mail',
            }),
            "first_name": forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'First name',
            }),
            "last_name": forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Last name',
            }),
        }
    def __init__(self, *args, **kwargs):
        super(RegisterForm, self).__init__(*args, **kwargs)
        self.fields['password1'].widget = forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Password'})
        self.fields['password2'].widget = forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Password confirmation'})


class LoginForm(AuthenticationForm):
    username = UsernameField(widget=forms.TextInput(attrs={"autofocus": True}))
    # class Meta:
        
    #     model = User
    #     fields = ["username", "password"]
    #     widgets = {
    #         "username": forms.TextInput(attrs={
    #             'class': 'form-control',
    #             'placeholder': 'E-mail',
    #         }),
    #     }

    def clean(self):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')
        print(username, password)
        if username is not None and password:
            backend = EmailBackend()
            self.user_cache = backend.authenticate(self.request, username=username, password=password)
            print(self.user_cache)
            if self.user_cache is None:
                raise self.get_invalid_login_error()
            else:
                self.confirm_login_allowed(self.user_cache)
        return self.cleaned_data
        
    def confirm_login_allowed(self, user):
        if not user.is_active:
            raise forms.ValidationError(
                ("Please confirm your email so you can log in."),
                code='inactive',
            )