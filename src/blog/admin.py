from typing import Sequence
from django.contrib import admin
from blog import models
from modeltranslation.admin import TranslationAdmin

class MediaInline(admin.TabularInline):
    model = models.Media

class BlogModelAdmin(TranslationAdmin):

    group_fieldsets = True  

    list_display = ("title", "description", 'created_at')
    fieldsets = (
        ("Text Fields", {"fields": ("title", "description",)}),
        ("Image Fields", {"fields": ("main_image",)}),
        ("Select Fields", {"fields": ("tags", )}),
    )
    list_filter = ("tags",)
    empty_value_display = 'unknown'
    search_fields: Sequence[str]
    search_fields = ['tags__name', 'title']
    inlines =[
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

class CommentModelAdmin(admin.ModelAdmin):
    list_display = ("author", "blog", "comment","created_at")
    list_display_links = ("author", "comment", "created_at")

class MediaModelAdmin(admin.ModelAdmin):
    list_display = ("media",)

admin.site.register(models.Blog, BlogModelAdmin)
admin.site.register(models.Tag, TagModelAdmin)
admin.site.register(models.Comment, CommentModelAdmin)
admin.site.register(models.Media, MediaModelAdmin)