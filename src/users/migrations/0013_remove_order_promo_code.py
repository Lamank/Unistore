# Generated by Django 4.0.5 on 2022-12-12 14:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0012_remove_order_country_alter_order_city_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='promo_code',
        ),
    ]
