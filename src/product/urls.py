from django.urls import path, re_path
from product.views import  ProductListView, ProductDetailView

app_name = 'product'


urlpatterns = [
    path('', ProductListView.as_view(), name='product-list'),

    path('<slug:slug>/', ProductDetailView.as_view(), name='product-detail'),
   
]
