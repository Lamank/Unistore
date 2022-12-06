from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import get_user_model
from django_countries.fields import CountryField

User = get_user_model()


class CheckoutOrder(forms.Form):
    COUNTRY_CHOICES = [('1', 'Azerbaijan'),('2', 'Turkey'),('3', 'USA'),]
    PAYMENT_CHOICES = [('1' ,'Cash on Delivery'), ('2' , 'Credit Card'),('3', 'Paypall')]
    reciever = forms.CharField(
        max_length=35,
        label='Receiver',
        widget=forms.TextInput(attrs={"placeholder":"Example Example",  'class': "form-control", 'name':'receiver'}) 
        )
    phone = forms.CharField(
        label='Phone',
        widget=forms.TextInput(attrs={'placeholder':'+994(70)1234567',  'class': 'form-control', 'name':'phone'})
        )
    email = forms.EmailField(
        label='E-mail', 
        max_length=128,
        widget=forms.EmailInput(attrs={'name':'email', 'class':'form-control', 'placeholder':'example@gmail.com'}))
    # country = forms.ChoiceField(
    #     label='Choose country',
    #     widget=forms.Select(attrs={'class' : 'form-control select', 'id':'country'}),
    #     choices=COUNTRY_CHOICES,
    # )
    country = CountryField(blank_label='Select Country').formfield(
        widget=forms.Select(attrs={'class' : 'form-control select', 'id':'country'})
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
    promo_code = forms.CharField(
        required=False,
        label='Promo Code',
        max_length=10,
        widget=forms.TextInput(attrs={'class': "form-control", 'name':'promo'}) )

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
    username = forms.CharField(label='Email / Username')
    class Meta:
        
        model = User
        fields = ["email", "password"]
        widgets = {
            "email": forms.EmailInput(attrs={
                'class': 'form-control',
                'placeholder': 'E-mail',
            }),
        }
