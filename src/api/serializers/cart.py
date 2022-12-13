from rest_framework.serializers import ModelSerializer
from users.models import Cart, CartItem
from api.serializers.product import ProductSerializer



class CartSerializer(ModelSerializer):
    class Meta:
        model = Cart
        fields = "__all__"


class CartItemSerializer(ModelSerializer):
    class Meta:
        model = CartItem
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data['product'] = ProductSerializer(instance.product).data
        data['cart'] = CartSerializer(instance.cart).data
        return data
