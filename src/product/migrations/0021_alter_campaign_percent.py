# Generated by Django 4.0.5 on 2022-11-19 17:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0020_remove_product_discount_alter_campaign_created_at_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='campaign',
            name='percent',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
