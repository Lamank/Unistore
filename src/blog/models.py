import string 
import random 
from datetime import datetime
from django.db import models
from django.db.models.signals import pre_save
from django.template.defaultfilters import slugify
from django.utils.text import slugify 
from django.urls import reverse
# Create your models here.

class Blog(models.Model):
    title = models.CharField(max_length=150)
    description = models.TextField()
    slug = models.SlugField(max_length=250, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True)
    main_image = models.ImageField(upload_to="uploads/%Y/%m/%d/", null=True, blank=True)
    tags = models.ManyToManyField(
        "blog.Tag",
    )
   
    def get_absolute_url(self):
        return reverse("blog:blog-detail", kwargs={"slug": self.slug})
    
    def __str__(self) -> str:
        return self.title

def random_string_generator(size=10, chars=string.ascii_lowercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))


def unique_slug_generator(instance, new_slug=None):
    if new_slug is not None:
        slug = new_slug
    else:
        slug = slugify(instance.title)
    Class = instance.__class__
    qs_exists = Class.objects.filter(slug=slug).exists()

    if qs_exists:
        new_slug = "{slug}-{randstr}".format(
            slug=slug, randstr=random_string_generator(size=4))

        return unique_slug_generator(instance, new_slug=new_slug)
    return slug


def pre_save_receiver(sender, instance, *args, **kwargs):
     if not instance.slug:
        instance.slug = unique_slug_generator(instance)

pre_save.connect(pre_save_receiver, sender=Blog)

class Media(models.Model):
    blog = models.ForeignKey(
        'blog.blog', null=True, on_delete=models.CASCADE)
    media = models.FileField(upload_to="uploads/%Y/%m/%d/")
  

    def __str__(self) -> str:
        return str(self.media.url)

    @property
    def imageUrl(self) -> str:
        try:
            url = self.image.url
        except:
            url = ''
        return url

class Tag(models.Model):
    name = models.CharField(max_length=50)
    
    def __str__(self) -> str:
        return self.name

class Comment(models.Model):
    author = models.ForeignKey("users.user",  on_delete=models.CASCADE)
    parent = models.ForeignKey(
        'self',
        null=True, 
        blank=True, 
        on_delete=models.CASCADE,
        related_name='replies')
    blog = models.ForeignKey(
        'blog.Blog',
         on_delete=models.CASCADE,
         null=True)
    email = models.EmailField(max_length=128)
    comment = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateField(auto_now=True)


    class Meta:
        ordering = ['-created_at']
        
    def __str__(self) -> str:
        return str(self.author)

    def children(self):
        return Comment.objects.filter(parent=self)

   
    @property
    def is_parent(self):
        if self.parent is not None:
            return False
        return True