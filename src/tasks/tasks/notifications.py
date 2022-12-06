from datetime import timedelta
from django.utils import timezone
from django.contrib.auth import get_user_model
from django.conf import settings
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from celery import shared_task

from product.services.products import get_popular_products
from core.models import Subscriber
User = get_user_model()

@shared_task
def send_new_product_notifications() -> None:
    now = timezone.now() + timedelta(hours=4)
    users = User.objects.filter(last_login__lte=(now - timedelta(days=30)))
    
    products = get_popular_products()
    context = {
        "products": products,
    }
    html_content = render_to_string('tasks/email-subscribers.html', context=context)
    text_content = strip_tags(html_content)
    
    email = EmailMultiAlternatives(
        "New Products",
        text_content,
        settings.EMAIL_HOST_USER,
        users,
        )

    email.attach_alternative(html_content, "text/html")
    email.send()





@shared_task()
def send_popular_products_to_subscribers() -> None:
    subscribers = Subscriber.objects.all().values_list("email", flat=True)
    now = timezone.now() + timedelta(hours=4)
    products = get_popular_products().filter(added_at__lte=(now - timedelta(days=7)))[:3]

    context = {
        "products": products,
    }

    html_content = render_to_string('tasks/email-subscribers.html', context=context)
    text_content = strip_tags(html_content)

    email = EmailMultiAlternatives(
        "New Popular Products",
        text_content,
        settings.EMAIL_HOST_USER,
        subscribers,
        )

    email.attach_alternative(html_content, "text/html")
    email.send()

   