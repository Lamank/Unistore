from django.conf import settings
from django.core.mail import send_mail
from celery import shared_task

@shared_task
def send_contact_email(email: str, message: str) -> None:
    print("Sending contact email...".upper())
    
    send_mail(
        subject="Unistore Contact",
        message=f"Your request ({message}) has been taken into account. Answer will be given as soon as possible",
        from_email=settings.EMAIL_HOST_USER,
        recipient_list=[email,],
    )
