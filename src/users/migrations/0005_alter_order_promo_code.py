# Generated by Django 4.0.5 on 2022-11-26 11:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0004_alter_order_created_at_alter_order_modified_at'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='promo_code',
            field=models.CharField(blank=True, default=None, max_length=10, null=True),
        ),
    ]