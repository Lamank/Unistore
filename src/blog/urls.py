from django.urls import path
from . import views

from blog.views import BlogListView

app_name = 'blog'

urlpatterns = [
    path('', BlogListView.as_view(), name='blog'),
    path('<slug:slug>/', views.detail_blog, name='blog-detail')
]
