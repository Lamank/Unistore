# Generated by Django 4.0.5 on 2022-11-24 08:37

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_alter_subscriber_added_at'),
    ]

    operations = [
        migrations.RenameField(
            model_name='subscriber',
            old_name='mail',
            new_name='email',
        ),
    ]