# Generated by Django 4.0.5 on 2022-12-08 17:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0008_cart_is_complete'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='email',
        ),
    ]