from django.contrib import admin
from core import models
# Register your models here.

class SubscriberModelAdmin(admin.ModelAdmin):
    list_display = ('email', 'added_at')

class ContactModelAdmin(admin.ModelAdmin):
    list_display = ('mail', 'message')
    list_display_links = ('mail', 'message')


admin.site.register(models.Subscriber, SubscriberModelAdmin)
admin.site.register(models.Contact, ContactModelAdmin)