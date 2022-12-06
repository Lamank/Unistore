from datetime import date
from distutils.command.upload import upload
from operator import truediv
from unicodedata import name
from django.db import models
from django.db.models import QuerySet
from django.db.models.signals import pre_save
from .slugify import unique_slug_generator
# Create your models here.

class Product(models.Model):
    title = models.CharField(max_length=150)
    description = models.TextField()
    price = models.FloatField()
    discounted_price = models.FloatField(null=True, blank=True, default=0.0)
    slug = models.SlugField(max_length=250, null=True, blank=True)
    quantity = models.PositiveIntegerField(null=True, blank=True)
    main_image = models.ImageField(upload_to="uploads/%Y/%m/%d/", null=True)
    tags = models.ManyToManyField(
        "product.Tag",
    )
    category = models.ForeignKey(
        'product.Category', 
        null=False, 
        on_delete=models.CASCADE)
    brand = models.ForeignKey(
        'product.Brand', 
        null=False, 
        on_delete=models.CASCADE)
    screen_size = models.ForeignKey(
        'product.Screen', 
        null=True, 
        blank=True,
        on_delete=models.CASCADE)
    added_at = models.DateField(auto_now_add=True)
    operating_system = models.CharField(max_length=150, null=True, blank=True)
    display = models.OneToOneField(
        'product.Display', 
        on_delete=models.CASCADE, 
        null=True,
        blank=True)
    campaign = models.ForeignKey(
        'product.Campaign',
        null=True,
        blank=True,
        on_delete=models.CASCADE)
    processor = models.TextField(null=True, blank=True)
    processor_tech = models.TextField(null=True, blank=True)
    graphics = models.TextField(null=True, blank=True)
    memory = models.CharField(max_length=100, null=True, blank=True)
    hard_drive = models.TextField(null=True, blank=True)
    wireless = models.OneToOneField(
        'product.Wireless', 
        on_delete=models.CASCADE, 
        null=True, 
        blank=True)
    power_supply = models.CharField(max_length=100, null=True, blank=True)
    battery = models.CharField(max_length=100, null=True, blank=True)

    def __str__(self) -> str:
        return self.title 

def pre_save_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = unique_slug_generator(instance)
    if instance.campaign:
        discounted_price = instance.price - (instance.price * instance.campaign.percent)/100
        instance.discounted_price = round(discounted_price, 2)
pre_save.connect(pre_save_receiver, sender=Product)




class Category(models.Model):
    name = models.CharField(max_length=100)
    class Meta:
        verbose_name_plural = "categories"

    def __str__(self) -> str:
        return self.name

class Tag(models.Model):
    name = models.CharField(max_length=50)
    
    def __str__(self) -> str:
        return self.name

class Logo(models.Model):
    logo = models.ImageField(upload_to="brands/", null=True)

    def __str__(self) -> str:
        return str(self.logo.url)


class Media(models.Model):
    product = models.ForeignKey(
        'product.product', null=True, on_delete=models.CASCADE)
    media = models.FileField(upload_to="uploads/%Y/%m/%d/")

    def __str__(self) -> str:
        return str(self.media.url)

    @property
    def imageUrl(self) -> str:
        try:
            url = self.image.url
        except:
            url = ''
        return url


class Display(models.Model):
    screen = models.CharField(max_length=200, null=True)
    resolution = models.CharField(max_length=200, null=True)
    color_settings = models.CharField(max_length=255, null=True)
    touch = models.CharField(max_length=150, null=True)

    def __str__(self) -> str:
        return self.screen

class Campaign(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    percent = models.IntegerField(null=True, blank=True)
    is_active = models.BooleanField(default=False)
    usage_limit = models.IntegerField(default=5)
    image = models.ImageField(null=True, blank=True, upload_to="uploads/%Y/%m/%d/")
    extra_image = models.ImageField(null=True, blank=True, upload_to="uploads/%Y/%m/%d/")
    activated_at = models.DateTimeField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.name

class Wireless(models.Model):
    wifi = models.CharField(max_length=255, null=True)
    bluetooth = models.CharField(max_length=150, null=True)

    def __str__(self) -> str:
        return self.wifi + ' ' + self.bluetooth



class Brand(models.Model):
    name = models.CharField(max_length=100)
    logo = models.ForeignKey(
        'product.Logo', on_delete=models.CASCADE, null=True)

    def __str__(self) -> str:
        return self.name


class Screen(models.Model):
    size = models.CharField(max_length=5)

    def __str__(self) -> str:
        return str(self.size)


class ProductReview(models.Model):
    product = models.ForeignKey('product.Product', on_delete=models.CASCADE)
    author = models.ForeignKey('users.User', on_delete=models.CASCADE)
    comment = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    parent = models.ForeignKey("self", null=True, blank=True, on_delete=models.CASCADE)

    class Meta:
        ordering = ["-created_at"] 

    def __str__(self) -> str:
        return self.comment
    
    def children(self) -> QuerySet:
        return ProductReview.objects.filter(parent=self)
    
    @property
    def is_parent(self) -> bool:
        if self.parent is not None:
            return False
        return True

