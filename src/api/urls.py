from django.urls import path
from api.views import *
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

app_name = "api"

urlpatterns = [
    path('register/', RegisterApiView.as_view(), name='users_register'),
    path('token/', TokenObtainPairView.as_view(), name='token-obtain-pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token-refresh'),
    path('category/', CategoryListCreateAPIView.as_view(), name='category-list'),
    path('category/<int:pk>/', CategoryRetrieveUpdateAPIView.as_view(), name='category-retrieve-update-destroy'),

    path('product/', ProductListCreateView.as_view(), name='product_list'),
    path('product/<int:pk>/', ProductRetrieveUpdateAPIView.as_view(), name='product_retrieve_update_destroy'),
    path("blog/", BlogListCreateView.as_view(), name='blog_list'),
    path("blog/<int:pk>/", BlogRetrieveUpdateAPIView.as_view(), name='blog_retrieve_update_destroy'),
    path('media/<int:pk>/', MediaRetrieveUpdateAPIView.as_view(), name='media_retrieve_update_destroy'),
    path('display/<int:pk>/', DisplayRetrieveUpdateAPIView.as_view(), name='display_retrieve_update_destroy'),
    path('wireless/<int:pk>/', WirelessRetrieveUpdateAPIView.as_view(), name='wireless_retrieve_update_destroy'),
    path('campaign/<int:pk>/', CampaignRetrieveUpdateAPIView.as_view(), name='campaign_retrieve_update_destroy'),
    path('brand/<int:pk>/', BrandRetrieveUpdateAPIView.as_view(), name='brand_retrieve_update_destroy'),
    path('screen/<int:pk>/', ScreenRetrieveUpdateAPIView.as_view(), name='screen_retrieve_update_destroy'),
    path('cart/', CartListCreateAPIView.as_view(), name='cart_list_create'),
    path('cart/<int:pk>', CartRetrieveUpdateAPIView.as_view(), name='cart_retrieve_update_destroy'),
    path('cart-item/', CartItemListCreateAPIView.as_view(), name='cart_item_list_create'),
    path('cart-item/<int:pk>', CartItemRetrieveUpdateAPIView.as_view(), name='cart_retrieve_update_destroy'),
    path('order/', OrderListCreateAPIView.as_view(), name='order_list_create'),
    path('order/<int:pk>', OrderRetrieveUpdateAPIView.as_view(), name='order_retrieve_update_destroy'),
    path('order-item/', OrderItemListCreateAPIView.as_view(), name='order_item_list_create'),
    path('order-item/<int:pk>', OrderItemRetrieveUpdateAPIView.as_view(), name='order_retrieve_update_destroy'),
    path('wishlist/', WishlistListCreateAPIView.as_view(), name='wishlist_list_create'),
    path('wishlist/<int:pk>', WishlistRetrieveUpdateDestroyAPIView.as_view(), name='wishlist_retrieve_update_destroy'),
]
