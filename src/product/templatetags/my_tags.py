from django import template
from django.db.models import QuerySet
from decimal import Decimal
from product.models import Campaign

register = template.Library()


@register.simple_tag(takes_context=True)
def param_replace(context, **kwargs):
    d = context['request'].GET.copy()
    for k, v in kwargs.items():
        d[k] = v
    for k in [k for k, v in d.items() if not v]:
        del d[k]
    return d.urlencode()


@register.filter(name="discount")
def calculate_discount_price(product_price: float, campaign: Campaign) -> float:
    return round(Decimal(product_price * (100 - int(campaign))/100), 2)
