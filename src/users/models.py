from email.policy import default
from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    email = models.EmailField(max_length=128, unique=True)
    
    class Meta:
        verbose_name = "User"
        verbose_name_plural = "Users"
    
    def __str__(self) -> str:
        return str(self.email)

class Wishlist(models.Model):
    product = models.ForeignKey("product.Product", null=False, blank=True, on_delete=models.CASCADE)
    user = models.ForeignKey("users.User", null=False, blank=True, on_delete=models.CASCADE)

    def __str__(self) -> str:
        return str(self.user) + ' ' + str(self.product)

class Cart(models.Model):
    owner = models.ForeignKey('users.User', null=False, on_delete=models.CASCADE, related_name="cart")
    total = models.FloatField(null=True)
    created_at = models.DateField(auto_now_add=True)
    modified_at = models.DateField(auto_now=True)
    is_complete = models.BooleanField(default=False)

    @property
    def get_cart_total(self):
        cart_items = self.cartitem.all()
        total = sum([item.get_total for item in cart_items])
        return total

    @property
    def get_cart_items(self):
        cart_items = self.cartitem.all()
        total = sum([item.quantity for item in cart_items])
        return total

    def __str__(self) -> str:
        return str(self.owner)

class CartItem(models.Model):
    cart = models.ForeignKey('users.Cart', on_delete=models.CASCADE, related_name="cartitem")
    product = models.ForeignKey('product.Product', on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()
    added_at = models.DateField(auto_now_add=True)
    modified_at = models.DateField(auto_now=True)

    @property
    def get_total(self):
        if self.product.discounted_price != 0.0:
            total = round((self.product.discounted_price * self.quantity), 2)
        else:
            total = round((self.product.price * self.quantity), 2)
        return total

    def __str__(self) -> str:
        return str(self.cart)

class Order(models.Model):
    class Status(models.TextChoices):
        CANCELED = 'canceled'
        ON_PROCESSING = 'on_processing'
        DONE = 'done'

    status = models.CharField(
        choices=Status.choices,
        default='on_processing',
        max_length=13,
    )
    products = models.ManyToManyField(
        'product.Product',
        through='users.OrderItem',
    )
    user = models.ForeignKey("users.User", null=False, blank=True, on_delete=models.CASCADE)
    phone = models.CharField(max_length=30)
    receiver = models.CharField(max_length=40, null=True, blank=True)
    total = models.FloatField()
    products_quantity = models.PositiveIntegerField(
        default=0
    )
    country = models.CharField(max_length=100, null=False)
    city = models.CharField(max_length=100, null=False)
    street = models.CharField(max_length=200)
    building = models.IntegerField()
    zip = models.IntegerField()
    payment = models.CharField(max_length=100)
    promo_code = models.CharField(max_length=10, null=True, blank=True, default=None)
    complete = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return str(str(self.user))

class OrderItem(models.Model):
    order = models.ForeignKey('users.Order', on_delete=models.CASCADE)
    product = models.ForeignKey('product.Product', on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    created_at = models.DateField(auto_now_add=True)
    modified_at = models.DateField(auto_now=True)

    def __str__(self) -> str:
        return str(self.order)