from django.contrib import admin
from typing import Sequence
from django.db.models import QuerySet
from product import models
from modeltranslation.admin import TranslationAdmin

class MediaInline(admin.TabularInline):
    model = models.Media


class ProductModelAdmin(TranslationAdmin):
    group_fieldsets = True  
    list_display = ('title', "category", "brand", "price", "quantity", "campaign", "added_at", "main_image")
    list_display_links = ('title', "category", "brand", "added_at", "main_image")
    fieldsets = (
        ("Text Fields", 
        {"fields": ("title", "description", "price","quantity")}),
        ("image Fields",
        {"fields": ("main_image",)}),
        ("Select Fields", 
        {"fields": ("category", "brand", "screen_size", "tags", "campaign")}),
        ("Requirements Field", 
        {"fields": ("display", "wireless","operating_system", "processor", "processor_tech", "graphics", "memory", "hard_drive", "power_supply", "battery")})
    )
    readonly_fields = ("added_at",)
    list_filter = ("added_at",
     "title",
      ("brand", admin.RelatedOnlyFieldListFilter), 
      "category")
    empty_value_display = 'unknown'
    # prepopulated_fields = {"slug": ("title",)}
    search_fields = ['category__name', 'brand__name']
    inlines = [
        MediaInline,
    ]
    class Media:
        js = (
            'http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js',
            'http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js',
            'modeltranslation/js/tabbed_translation_fields.js',
        )
        css = {
            'screen': ('modeltranslation/css/tabbed_translation_fields.css',),
        }
class TagModelAdmin(TranslationAdmin):
    
    group_fieldsets = True  

    list_display = ("name",)
    search_fields: Sequence[str]
    search_fields = ["name"]
    class Media:
        js = (
            'http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js',
            'http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js',
            'modeltranslation/js/tabbed_translation_fields.js',
        )
        css = {
            'screen': ('modeltranslation/css/tabbed_translation_fields.css',),
        }


class CampaignModelAdmin(TranslationAdmin):

    group_fieldsets = True  

    list_display = ('name','description')

    class Media:
        js = (
            'http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js',
            'http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js',
            'modeltranslation/js/tabbed_translation_fields.js',
        )
        css = {
            'screen': ('modeltranslation/css/tabbed_translation_fields.css',),
        }

class CategoryModelAdmin(TranslationAdmin):

    group_fieldsets = True  

    list_display = ('name',)

    class Media:
        js = (
            'http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js',
            'http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js',
            'modeltranslation/js/tabbed_translation_fields.js',
        )
        css = {
            'screen': ('modeltranslation/css/tabbed_translation_fields.css',),
        }

class BrandModelAdmin(admin.ModelAdmin):
    list_display = ('name',)

class ScreenModelAdmin(admin.ModelAdmin):
    list_display = ('size',)

class ProductReviewModelAdmin(admin.ModelAdmin):
    list_display = ('author', 'product')

class MediaModelAdmin(admin.ModelAdmin):
    list_display = ("media",)



admin.site.register(models.Product, ProductModelAdmin)
admin.site.register(models.Category, CategoryModelAdmin)
admin.site.register(models.Campaign, CampaignModelAdmin)
admin.site.register(models.Brand, BrandModelAdmin)
admin.site.register(models.Tag, TagModelAdmin)
admin.site.register(models.Screen, ScreenModelAdmin)
admin.site.register(models.ProductReview, ProductReviewModelAdmin)
admin.site.register(models.Media, MediaModelAdmin)
admin.site.register(models.Logo)
admin.site.register(models.Display)
admin.site.register(models.Wireless)