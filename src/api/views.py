from django.contrib.auth import get_user_model
from rest_framework import generics, status
from rest_framework.permissions import AllowAny
from rest_framework.response import Response

from users.models import Cart, CartItem, OrderItem, Order, Wishlist
from .serializers.register import RegisterSerializer
from .serializers.product import *
from .serializers.cart import CartSerializer, CartItemSerializer
from .serializers.order import OrderSerializer, OrderItemSerializer
from .serializers.blog import BlogSerializer
from .serializers.wishlist import WishlistSerializer
from product.models import Product, Category, Media
from product.services.products import product_list
from blog.models import Blog

# Create your views here.

UserModel = get_user_model()
# register
class RegisterApiView(generics.CreateAPIView):
    queryset = UserModel.objects.all()
    permission_classes = [AllowAny]
    serializer_class = RegisterSerializer

# product 
class ProductListCreateView(generics.ListCreateAPIView):
    queryset = Product.objects.all()
    permission_classes = [AllowAny]
    serializer_class = ProductSerializer

    def get(self, *args, **kwargs):
        queryset = product_list()

        tag = self.request.query_params.get("tag")
        category = self.request.query_params.get("category")
        screen_size = self.request.query_params.get("size")
        brand = self.request.query_params.get("brand")
        min_price = self.request.query_params.get("min_price")
        max_price = self.request.query_params.get("max_price")
        order_by = self.request.query_params.get("order")
        value = self.request.query_params.get("value")
        campaign = self.request.query_params.get("campaign")
        if tag:
            if tag != "all":
                queryset = queryset.filter(tags__id=tag)
        if campaign:
            queryset = queryset.filter(campaign__id=campaign)
        if category:
            queryset = queryset.filter(category__id__in=category.split(','))
        if screen_size:
            queryset = queryset.filter(screen_size__id__in=screen_size.split(','))
        if brand:
            queryset = queryset.filter(brand__id__in=brand.split(','))
        if min_price:
            queryset = queryset.filter(price__gte=float(min_price))
        if max_price:
            queryset = queryset.filter(price__lte=float(max_price))
        if order_by:
            order_by = str(order_by).lower()
            if value=="asc":
                queryset = queryset.order_by(order_by)
            else:
                queryset = queryset.order_by(f'-{order_by}')
        serializer = ProductSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

class ProductRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Product.objects.all()
    permission_classes = [AllowAny]
    serializer_class = ProductSerializer

# category
class CategoryListCreateAPIView(generics.ListCreateAPIView):
    queryset = Category.objects.all()
    permission_classes = [AllowAny]
    serializer_class = CategorySerializer

class CategoryRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Category.objects.all()
    permission_classes = [AllowAny]
    serializer_class = CategorySerializer

# Media
class MediaRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Media.objects.all()
    permission_classes = [AllowAny]
    serializer_class = MediaSerializer

# Display
class DisplayRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Display.objects.all()
    permission_classes = [AllowAny]
    serializer_class = DisplaySerializer

# Wireless
class WirelessRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Wireless.objects.all()
    permission_classes = [AllowAny]
    serializer_class = WirelessSerializer

# Campaign
class CampaignRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Campaign.objects.all()
    permission_classes = [AllowAny]
    serializer_class = CampaignSerializer

# Brand
class BrandRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Brand.objects.all()
    permission_classes = [AllowAny]
    serializer_class = BrandSerializer

# screen
class ScreenRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Screen.objects.all()
    permission_classes = [AllowAny]
    serializer_class = ScreenSerializer

# cart
class CartListCreateAPIView(generics.ListCreateAPIView):
    queryset = Cart.objects.all()
    permission_classes = [AllowAny]
    serializer_class = CartSerializer

class CartRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Cart.objects.all()
    permission_classes = [AllowAny]
    serializer_class = CartSerializer

# cart_item
class CartItemListCreateAPIView(generics.ListCreateAPIView):
    queryset = CartItem.objects.all()
    permission_classes = [AllowAny]
    serializer_class = CartItemSerializer

class CartItemRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = CartItem.objects.all()
    permission_classes = [AllowAny]
    serializer_class = CartItemSerializer

# order
class OrderListCreateAPIView(generics.ListCreateAPIView):
    queryset = Order.objects.all()
    permission_classes = [AllowAny]
    serializer_class = OrderSerializer

class OrderRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Order.objects.all()
    permission_classes = [AllowAny]
    serializer_class = OrderSerializer

# order_item
class OrderItemListCreateAPIView(generics.ListCreateAPIView):
    queryset = OrderItem.objects.all()
    permission_classes = [AllowAny]
    serializer_class = OrderItemSerializer

class OrderItemRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = OrderItem.objects.all()
    permission_classes = [AllowAny]
    serializer_class = OrderItemSerializer

# blog

class BlogListCreateView(generics.ListCreateAPIView):
    queryset = Blog.objects.all()
    permission_classes = [AllowAny]
    serializer_class = BlogSerializer

    def get(self, *args, **kwargs):
        queryset = Blog.objects.all()

        tag = self.request.query_params.get("tag")
       
        if tag:
            if tag != "all":
                queryset = queryset.filter(tags__id=tag)
        serializer = BlogSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

class BlogRetrieveUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Blog.objects.all()
    permission_classes = [AllowAny]
    serializer_class = BlogSerializer

# wishlist
class WishlistListCreateAPIView(generics.ListCreateAPIView):
    queryset = Wishlist.objects.all()
    permission_classes = [AllowAny]
    serializer_class = WishlistSerializer

class WishlistRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Wishlist.objects.all()
    permission_classes = [AllowAny]
    serializer_class = WishlistSerializer
