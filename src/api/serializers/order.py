from rest_framework.serializers import ModelSerializer
from users.models import Order, OrderItem
from api.serializers.product import ProductSerializer

from users.models import User



class OrderSerializer(ModelSerializer):
    class Meta:
        model = Order
        fields = "__all__"


class OrderItemSerializer(ModelSerializer):
    class Meta:
        model = OrderItem
        fields = (
            "id",
            "quantity",
            "created_at",
            "modified_at",
            "order",
            "product"
        )
    def to_representation(self, instance):
        data = super().to_representation(instance)
        data['product'] = ProductSerializer(instance.product).data
        data['order'] = OrderSerializer(instance.order).data
        return data

    depth = 1

class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'name', 'email')