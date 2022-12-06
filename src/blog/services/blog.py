from functools import reduce
import operator
from blog.models import Blog, Tag, Comment, Media
from django.db.models import QuerySet, Q, Count

def get_comment (blog_id: int) -> QuerySet:
    return Comment.objects.filter(blog = blog_id).filter(parent = None)

def get_blog_from_tag(blog_tag: str) -> QuerySet:
    tag = Tag.objects.filter(name = blog_tag).first().id
    return Blog.objects.filter(tags = tag)

def get_tags_from_blog(blog_id: int) -> QuerySet:
    tags_list = Blog.objects.filter(id = blog_id).values_list('tags', flat=True)
    tag = Tag.objects.filter(id__in = tags_list).values('name')
    return tag

def last_six_blogs() -> QuerySet:
    return Blog.objects.all().order_by('-created_at')
  
def searched_blog(data: str) -> QuerySet:
    data = data
    data_list = data.split()
    return Blog.objects.filter(reduce(operator.or_, (Q(title__icontains=data) | Q(description__icontains=data) for data in data_list)))

def most_popular_blog() -> QuerySet:
    return Comment.objects.annotate(comment_count=Count("blog")).order_by("-comment_count").values_list("blog", flat=True)
