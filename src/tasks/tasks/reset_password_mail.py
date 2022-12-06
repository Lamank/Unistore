from django.core.mail import EmailMessage
from django.conf import settings
from celery import shared_task

@shared_task()
def send_reset_email_mail(mail_subject: str, message: str, to_email: str) -> None:
    email = EmailMessage(subject=mail_subject, body=message, to=[to_email], from_email=settings.EMAIL_HOST_USER)
    email.send()
    return 'okey'