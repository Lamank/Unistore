from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password
from django.db.models import QuerySet
from users.models import Cart, User, Order, CartItem, Wishlist

UserModel = get_user_model()


def create_user_if_not_exist(
    *,
    email: str,
    first_name: str,
    last_name: str,
) -> User:

    if UserModel.objects.filter(email=email).exists():
        return  UserModel.objects.get(email=email)

    password = make_password(password=None)

    user = UserModel(
        username=email,
        email=email,
        first_name=first_name,
        last_name=last_name,
        password=password
    )
    user.save()

    return user


def create_cart_after_user_registered(user: User) -> None:
    Cart.objects.get_or_create(
        owner=user,
    )

def get_order_details(user_id: int) -> QuerySet:
    return Order.objects.filter(user=user_id).order_by('-created_at').first()


def get_user_cart(user_id: int) -> QuerySet:
    cart, _ = Cart.objects.get_or_create(owner=user_id)
    return cart