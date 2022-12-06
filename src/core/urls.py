
from django.urls import path, include
from . import views

app_name = 'core'

urlpatterns = [
    path('', views.home, name='home'),
    path('contact/', views.contact, name="contact"),
    path('about-contact/', views.about_contact, name="about"),
    path('faq/', views.faq, name="faq"),
    path('subscribe/', views.subscribe, name="subscribe"),
]

