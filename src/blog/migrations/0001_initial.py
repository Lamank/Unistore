# Generated by Django 4.0.5 on 2022-09-23 15:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Blog',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=150)),
                ('description', models.TextField()),
                ('slug', models.SlugField(blank=True, max_length=250, null=True)),
                ('created_at', models.DateField(auto_now_add=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Media',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('media', models.FileField(upload_to='uploads/%Y/%m/%d/')),
                ('is_main', models.BooleanField(default=False)),
                ('blog', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='blog.blog')),
            ],
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('author', models.CharField(max_length=100, null=True)),
                ('email', models.EmailField(max_length=128)),
                ('comment', models.TextField()),
                ('created_at', models.DateField(auto_now_add=True)),
                ('modified_at', models.DateField(auto_now=True)),
                ('blog', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='blog.blog')),
                ('parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='replies', to='blog.comment')),
            ],
            options={
                'ordering': ['-created_at'],
            },
        ),
        migrations.AddField(
            model_name='blog',
            name='tags',
            field=models.ManyToManyField(to='blog.tag'),
        ),
    ]