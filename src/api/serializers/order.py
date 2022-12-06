from rest_framework.serializers import ModelSerializer
from users.models import Order, OrderItem
from api.serializers.product import ProductSerializer



class OrderSerializer(ModelSerializer):
    class Meta:
        model = Order
        fields = "__all__"


class OrderItemSerializer(ModelSerializer):
    product = ProductSerializer(read_only=True)
    order = OrderSerializer(read_only=True)
    class Meta:
        model = OrderItem
        fields = (
            "id",
            # "quantity",
            "created_at",
            "modified_at",
            "order",
            "product"
        )

    depth = 1