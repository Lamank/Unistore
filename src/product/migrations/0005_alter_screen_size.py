# Generated by Django 4.0.5 on 2022-10-02 17:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0004_alter_productreview_created_at'),
    ]

    operations = [
        migrations.AlterField(
            model_name='screen',
            name='size',
            field=models.CharField(max_length=3),
        ),
    ]