import operator
from functools import reduce

from django.db.models import QuerySet, Q, Count

from product.models import Product, Media, Category, Screen, ProductReview, Tag, Campaign, Brand

def product_list() -> QuerySet:

    product_list= Product.objects.all().order_by('-added_at').distinct()
    # product_list = Product.objects.order_by('-added_at', '-price')
    
    return product_list

def get_products() -> QuerySet:
    return Product.objects.annotate(count = Count('productreview')).order_by('count').distinct()

def get_product_categories() -> QuerySet:
    return Category.objects.all()
     
def get_product_screen_size() -> QuerySet:
    return Screen.objects.all()

def get_product_brand() -> QuerySet:
    return Brand.objects.all()

def get_product_tag() -> QuerySet:
    return Tag.objects.all()

def get_reviews(product_id: int) -> QuerySet:
    return ProductReview.objects.filter(Q(product = product_id) & Q(parent = None))

def search_product(data: str) -> QuerySet:
    data_list = data.split()
    searching_prods = Product.objects.filter(reduce(operator.or_, (Q(title__icontains=data) | Q(operating_system__icontains=data) | Q(processor__contains = data) |Q(description__icontains=data) for data in data_list)))

    return searching_prods

def similar_product(product: Product) -> QuerySet:
    similar_products = Product.objects.filter(Q(category=product.category) | Q(brand=product.brand)).exclude(id=product.id).order_by("-id")
    if len(similar_products) > 4:
        return similar_products[:4]
    return similar_products


def get_specific_product(slug: str) -> QuerySet:
    return Product.objects.filter(slug=slug).first()

def get_specific_product_medias(product_id: int) -> QuerySet:
    return Media.objects.filter(product=product_id)

def get_discount_price(product_price: int, discount: Campaign) -> float:
    discount = int(discount.percent)
    return product_price * (100 + discount)/100

def get_popular_products() -> QuerySet:
    popular_prods = Product.objects.annotate(
        count = Count("productreview")
        ).order_by("-count", "-added_at")
    
    return popular_prods
    
def get_campaigns() -> QuerySet:
    return Campaign.objects.all().order_by('-created_at')