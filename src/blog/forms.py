
from django import forms
from blog.models import Comment

class BlogCommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['comment']
        widgets = {
            'comment': forms.Textarea(attrs={
                'class': 'form-control',
                'id': 'comment',
                'name': 'comment',
                'placeholder': 'Type here',
                'rows': 4,
            }),
        }