import json
from django.http.request import HttpRequest
from django.http.response import HttpResponse, JsonResponse
from django.shortcuts import render
from django.utils.timesince import timesince
from django.views import generic
from django.shortcuts import redirect
from blog.forms import BlogCommentForm
from blog.models import Blog, Comment, Tag
from blog.services.blog import *
from django.views import generic


class BlogListView(generic.ListView):
    paginate_by = 2
    model = Blog
    template_name = "blog/blog_list.html"

    def get_context_data(self, **kwargs) -> dict:
        context = super(BlogListView, self).get_context_data(**kwargs)
        tags = Tag.objects.all()
        context["tags"] = tags

        return context
    

def detail_blog(request: HttpRequest, slug) -> HttpResponse:
    blog = Blog.objects.filter(slug=slug).first()
    description = blog.description.split('\n')
    media = Media.objects.filter(blog_id=blog.id).first()
    comments = get_comment(blog.id)
    comment_form = BlogCommentForm(request.POST or None)
    if comment_form.is_valid():

        parent_obj = None
        try:
            parent_id = int(request.POST.get("parent_id"))
        except:
            parent_id = None
        if parent_id:
            parent_qs = Comment.objects.filter(id=parent_id)
            if parent_qs.exists() and parent_qs.count() == 1:
                parent_obj = parent_qs.first()
        new_comment = comment_form.save(commit=False)
        new_comment.blog = blog
        new_comment.parent = parent_obj
        new_comment.email = request.user.email
        new_comment.author = request.user
        new_comment.save()
     
        comment_form = BlogCommentForm()
        child_comment ={
            'username': (new_comment.author.username).capitalize(),
            'body': (new_comment.comment).capitalize(),
            'timestamp': timesince(new_comment.created_at)
        }
      
        return JsonResponse({'new_comment': child_comment})

    context = {"blog": blog, "description": description, "media": media, "comments": comments, "form": comment_form}
    return render(request, "blog/detail_blog.html", context=context)
