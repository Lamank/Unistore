from blog.models import Blog, Tag
from modeltranslation.translator import TranslationOptions , register

@register(Blog)
class BlogTranslationOptions(TranslationOptions):
    fields = ('title', 'description')

@register(Tag)
class TagTranslationOptions(TranslationOptions):
    fields = ('name', ) 