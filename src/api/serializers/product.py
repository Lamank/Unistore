from rest_framework import serializers
from rest_framework.validators import ValidationError

from product.models import (
    Product, 
    Category,
    Media,
    Display,
    Wireless,
    Campaign,
    Brand,
    Screen,
    Tag
)

class CategorySerializer(serializers.ModelSerializer):

    class Meta:
        model = Category
        fields = "__all__"

class MediaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Media
        fields = "__all__"

class DisplaySerializer(serializers.ModelSerializer):

    class Meta:
        model = Display
        fields = "__all__"

class WirelessSerializer(serializers.ModelSerializer):

    class Meta:
        model = Wireless
        fields = "__all__"

class CampaignSerializer(serializers.ModelSerializer):

    class Meta:
        model = Campaign
        fields = "__all__"

class BrandSerializer(serializers.ModelSerializer):

    class Meta:
        model = Brand
        fields = "__all__"

class ScreenSerializer(serializers.ModelSerializer):

    class Meta:
        model = Screen
        fields = "__all__"

class TagSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tag
        fields = "__all__"

class CampaignSerializer(serializers.ModelSerializer):

    class Meta:
        model = Campaign
        fields = "__all__"

class TagProductSerializer(serializers.ModelSerializer):
    tag_name = TagSerializer(read_only=True)

    class Meta:
        model = Tag
        fields =  "__all__"

class ProductSerializer(serializers.ModelSerializer):

    category = CategorySerializer(read_only=True)
    brand = BrandSerializer(read_only=True)
    screen_size = ScreenSerializer(read_only=True)
    campaign = CampaignSerializer(read_only=True)

    def validate(self, attrs: dict) -> dict:
        if attrs["price"] == 0:
            raise ValidationError("...")
        return attrs


    def get_tags(self, obj):
        tag_qs = Tag.objects.filter(product=obj)
        tags = TagProductSerializer(tag_qs, many=True).data
        return tags

    class Meta:
        model = Product
        fields = (
            'id',
            'title',
            'description',
            'price',
            'slug',
            'quantity',
            'main_image',
            'category',
            'screen_size',
            'brand',
            'tags',
            'added_at',
            'operating_system',
            'display',
            'campaign',
            'processor',
            'processor_tech',
            'graphics',
            'memory',
            'hard_drive',
            'wireless',
            'power_supply',
            'battery'
        )

        depth = 1

