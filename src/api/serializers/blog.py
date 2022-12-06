from rest_framework import serializers
from blog.models import (
    Blog, 
    Media,
    Tag,
)


class MediaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Media
        fields = "__all__"

class TagSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tag
        fields = "__all__"

class MediaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Media
        fields = "__all__"


class TagBlogSerializer(serializers.ModelSerializer):
    tag_name = TagSerializer(read_only=True)

    class Meta:
        model = Tag
        fields =  "__all__"
class BlogSerializer(serializers.ModelSerializer):

    def get_tags(self, obj):
        tag_qs = Tag.objects.filter(blog=obj)
        tags = TagBlogSerializer(tag_qs, many=True).data
        return tags

    class Meta:
        model = Blog
        fields =(
            "id",
            "title",
            "description",
            "main_image",
            "slug",
            "created_at",
            "tags",
        )
        
        depth = 1