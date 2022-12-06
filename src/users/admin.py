from typing import Sequence
from django.contrib import admin
from django.contrib.auth import get_user_model
from users import models

User = get_user_model()

class UserModelAdmin(admin.ModelAdmin):
    list_display = ['email', 'username',]
    list_display = ["first_name", "last_name", "username", "is_staff"]
    list_display_links = ["first_name", "last_name", "username",]
    list_filter = ("date_joined", "last_login", "is_staff")
    empty_value_display = 'unknown'
    search_fields: Sequence[str]
    search_fields = ["first_name", "last_name", "username", "email"]

class WishlistModelAdmin(admin.ModelAdmin):
    list_display = ['product', 'user']
    list_display_links = ['product', 'user']

    empty_value_display = "unknown"
    list_filter = ("user",)
    search_fields = ["user__username",  "product__title"]

class CartModelAdmin(admin.ModelAdmin):
    list_display = ['owner', 'total', 'created_at']
    list_display_links = ['owner', 'total', 'created_at']
    readonly_fields: Sequence[str]
    readonly_fields = ("created_at",)
    list_filter = ("owner", "created_at")
    empty_value_display = 'unknown'
    search_fields: Sequence[str]
    search_fields = ["owner__username",]

  
class CartItemModelAdmin(admin.ModelAdmin):
    list_display = ['cart', 'product', 'added_at']
    list_display_links = ['cart', 'product', 'added_at']
    readonly_fields: Sequence[str]
    readonly_fields = ("added_at",)
    list_filter = ("added_at", "cart__owner", "product__title")
    empty_value_display = 'unknown'
    search_fields: Sequence[str]
    search_fields = ["cart__owner", "product__title"]
    
    
class OrderModelAdmin(admin.ModelAdmin):
    list_display = ['user', 'country', 'city', 'created_at']
    list_display_links = ['user', 'country', 'city', 'created_at']
    readonly_fields: Sequence[str]
    readonly_fields = ("created_at",)
    list_filter = ("created_at", "user", "country", "city")
    empty_value_display = 'unknown'
    search_fields: Sequence[str]
    search_fields = ["user__username", "country"]
    
class OrderItemModelAdmin(admin.ModelAdmin):
    list_display = ['order', 'product', 'created_at']
    list_display_links = ['order', 'product', 'created_at']
    readonly_fields: Sequence[str]
    readonly_fields = ("created_at",)
    list_filter = ("created_at", "order__user")
    empty_value_display = 'unknown'
    search_fields: Sequence[str]
    search_fields = ["order__user__username", "product__title"]

    
admin.site.register(User, UserModelAdmin)
admin.site.register(models.Wishlist, WishlistModelAdmin)
admin.site.register(models.Cart, CartModelAdmin)
admin.site.register(models.CartItem, CartItemModelAdmin)
admin.site.register(models.Order, OrderModelAdmin)
admin.site.register(models.OrderItem, OrderItemModelAdmin)
