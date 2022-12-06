from django.core.mail import EmailMessage
from django.conf import settings
from celery import shared_task

@shared_task
def send_activate_email_mail(mail_subject: str, message: str, to_email: str) -> None:
    email = EmailMessage(mail_subject, message, to=[to_email,], from_email="admn.unistore@gmail.com")
    email.send()
