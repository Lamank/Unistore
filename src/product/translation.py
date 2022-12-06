from product.models import Category, Product, Campaign, Tag
from modeltranslation.translator import TranslationOptions , register

@register(Category)
class CategoryTranslationOptions(TranslationOptions):
    fields = ('name',)

@register(Product)
class ProductTranslationOptions(TranslationOptions):
    fields = ('title', 'description') 

@register(Campaign)
class CampaignTranslationOptions(TranslationOptions):
    fields = ('name', 'description') 

@register(Tag)
class TagTranslationOptions(TranslationOptions):
    fields = ('name', ) 