from rest_framework.serializers import ModelSerializer
from .product import ProductSerializer
from users.models import Wishlist

class WishlistSerializer(ModelSerializer):
    class Meta:
        model = Wishlist
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data['product'] = ProductSerializer(instance.product).data
        return data

    # def create(self, validated_data):
    #     data = validated_data.pop('product')
    #     print(data)
    #     print(data['id'])
    #     product_id = Product.objects.get(title=data['title'])
    #     print(product_id)
    #     instance = Wishlist.objects.create(**validated_data)
    #     return instance
    
    # def to_representation(self, instance):
    #     representation = super(WishlistSerializer, self).to_representation(instance)
    #     return representation
