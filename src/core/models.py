from django.db import models
from django.core.validators import validate_email

# Create your models here.
class Subscriber(models.Model):
    email = models.EmailField(max_length=100)
    added_at = models.DateTimeField(auto_now_add=True)
    def __str__(self) -> str:
        return self.email

class Contact(models.Model):
    mail = models.EmailField(
        max_length=128,
        blank=False,
        unique=False,
        validators=[validate_email],
        error_messages={
            'required': 'Please provide your email address.',
            'unique': 'An account with this email exist.'
        }
        ) #REMIND
    message = models.TextField()

    def __str__(self) -> str:
        return self.mail
