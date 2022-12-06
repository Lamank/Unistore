from django import forms
from core.models import Contact, Subscriber

class ContactForm(forms.ModelForm):
     class Meta:
        model = Contact
        fields = "__all__"
        widgets = {
            "message": forms.Textarea(attrs={
                'class': 'form-control',
                'name': 'message',
                'placeholder': 'Message',
                'rows': 5
                }),
            "mail": forms.EmailInput(attrs={
                'class': 'form-control',
                'name': 'email',
                'placeholder': 'E-mail',
                'required': True                
                }),
        }


class SubscribeToNewsletter(forms.ModelForm):
    class Meta:
        model = Subscriber
        fields = ("email",)
        widgets = {
            "email": forms.EmailInput(attrs={
                'class': 'form-control',
                'data-name': 'subscribe',
                'type': 'email',
                'name': 'email',
                'placeholder': 'E-mail',
                })
            }
  