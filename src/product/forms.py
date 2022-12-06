from django import forms
from product.models import ProductReview

class ProductReviewForm(forms.ModelForm):

    class Meta:
        model = ProductReview
        fields = ['comment']
        widgets = {
            "author": forms.TextInput(attrs={
                'class': 'form-control',
                'name': 'name',
                'placeholder': 'Name',
                'type': 'text',
            }),
            'comment': forms.Textarea(attrs={
                'class': 'form-control',
                'name': 'comment',
                'placeholder': 'Type here',
                'rows': 5,
            })
        }
    

   
