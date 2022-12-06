import pytest
from django.contrib.auth import get_user_model
from blog.models import Comment, Blog, Tag
from core.models import Subscriber, Contact
from product.models import Product, Category, Brand, Discount, Screen, ProductReview, Logo, Media, Display, Wireless
from users.models import Wishlist, Cart, CartItem, Order, OrderItem
from src.core.forms import ContactForm, SubscribeToNewsletter
from src.product.forms import ProductReviewForm
from users.forms import RegisterForm, LoginForm
from blog.forms import BlogCommentForm

User = get_user_model()

@pytest.fixture
def user_model():
    return get_user_model()

@pytest.fixture
def tag(db) -> Tag:
    return Tag.objects.create(name="Tag")

@pytest.fixture
def blog(db, tag, comment) -> Blog:
    blog = Blog.objects.create(
        title='blog_title',
        description='blog_desc',
        comment = comment
    )
    blog.tags.add(tag)
    return blog


@pytest.fixture
def comment(db, user_model) -> Comment:
    comment = Comment.objects.create(
        comment='Good',
        author = user_model.objects.create(
            first_name="Uni",
            last_name="Store",
            password="Unistore",
            email="unistore@gmail.com")
    )
    
    return comment

@pytest.fixture
def subscriber(db):
    subs = Subscriber.objects.create(
        mail = 'test@gmail.com'
    )
    return subs

@pytest.fixture
def contact(db):
    contact = Contact.objects.create(
        mail = 'test@gmail.com',
        message = 'I have some problems'
    )
    return contact

@pytest.fixture
def category(db) -> Category:
    return Category.objects.create(name="mobile phone")

@pytest.fixture
def brand(db) -> Brand:
    return Brand.objects.create(name="Asus")

@pytest.fixture
def product(db, category, brand) -> Product:
    return Product.objects.create(
        title="Hi",
        description="Yeap",
        price=1000,
        category=category,
        brand=brand,
        )

@pytest.fixture
def discount(db) -> Discount:
    return Discount.objects.create(
        percent=15,
        is_active=True,
    )

@pytest.fixture
def screen(db) -> Screen:
    return Screen.objects.create(size=16)

@pytest.fixture
def product_review(db, product) -> ProductReview:
    return ProductReview.objects.create(
        product=product,
        author=User.objects.create(
            first_name="First",
            last_name="Last",
            password="1872yiuwhd",
            email="email@gmail.com"
        ),
        comment="I like it..."
    )

@pytest.fixture
def user(db) -> User:
    return User.objects.create(
        username="Akbar",
        password="12345678",
        email="akbar@gmail.com"

    )

@pytest.fixture
def wishlist(db, product, user) -> Wishlist:
    return Wishlist.objects.create(
        product=product,
        user=user
    )

@pytest.fixture
def cart(db, user) -> Cart:
    return Cart.objects.create(
        owner=user,
        total=4321.99
    )

@pytest.fixture
def cart_item(db, cart, product) -> CartItem:
    return CartItem.objects.create(
        cart=cart,
        product=product,
        quantity=5,
    )

@pytest.fixture
def order(db, user) -> Order:
    return Order.objects.create(
        user=user,
        total=2000,
        country="United States",
        city="New York",
        street="something",
        building=2,
        zip=5,
    )

@pytest.fixture
def order_item(db, order, product) -> OrderItem:
    return OrderItem.objects.create(
        order=order,
        product=product,
    )


@pytest.fixture
def service_category(db) -> Category:
    return Category.objects.create(name="gaming laptop")

@pytest.fixture
def service_brand(db) -> Brand:
    return Brand.objects.create(name="Hp")

@pytest.fixture
def service_product(db, service_brand, service_category) -> Product:
    return Product.objects.create(
    title="Hi",
    description="Yeap",
    price=1000,
    discount=Discount.objects.create(
        percent=10,
        is_active=True,
    ),
    category=service_category,
    brand=service_brand,
    )

@pytest.fixture
def form_with_valid_data(db) -> ContactForm:
    return ContactForm(data={
            "mail": "a@gmail.com",
            "message": "Hello"
        })
    
@pytest.fixture
def form_with_invalid_data(db) -> ContactForm:
    return ContactForm(data={
            "mail": "a",
            "message": "Hello"
        })

@pytest.fixture
def product_review_form_with_valid_data(db) -> ProductReviewForm:
    return ProductReviewForm(
        data={
            "author": "Akbar",
            "comment": "Thank you for your review!",
        }
    )

@pytest.fixture
def product_review_form_with_invalid_data(db) -> ProductReviewForm:
    return ProductReviewForm(
        data={

        }
    )

@pytest.fixture
def register_form_with_valid_data(db) -> RegisterForm:
    return RegisterForm(data={
        "username": "Akbar",
        "email": "akbar@gmail.com",
        "password1": "qwert!@#$%",
        "password2": "qwert!@#$%",
        }
    )

@pytest.fixture
def register_form_with_invalid_data(db) -> RegisterForm:
    return RegisterForm(data={

        }
    )

@pytest.fixture
def subscribe_to_newsletter_form_with_valid_data(db) -> SubscribeToNewsletter:
    return SubscribeToNewsletter(data={
            "email": "akbar@gmail.com",
        }
    )

@pytest.fixture
def subscribe_to_newsletter_form_with_invalid_data(db) -> SubscribeToNewsletter:
    return SubscribeToNewsletter(data={

        }
    )

@pytest.fixture
def blog_comment_form_with_valid_data(db) -> BlogCommentForm:
    return BlogCommentForm(data={
        "comment": "test comment",
        "author": "test author",
        "email": "test@gmail.com",
        }
    )

@pytest.fixture
def blog_comment_form_with_invalid_data(db) -> BlogCommentForm:
    return BlogCommentForm(data={
        
        }
    )

@pytest.fixture
def login_form_with_invalid_data(db) -> LoginForm:
    return LoginForm(data={

        }
    )

@pytest.fixture
def login_form_with_valid_data(db) -> LoginForm:
    return LoginForm(data={
            "username": "Admin",
            "email": "Admin",
            "password": "1",
        }
    )

@pytest.fixture
def logo(db) -> Logo:
    return Logo.objects.create(
        logo="Apple",
    )

@pytest.fixture
def media(db, product) -> Media:
    return Media.objects.create(
        product=product,
        media="Laptop photo",
        is_main=True,
    )

@pytest.fixture
def display(db) -> Display:
    return Display.objects.create(
        screen="17 inch",
        resolution="1080",
        color_settings="RGB color_settings",
        touch="true", 
    )

@pytest.fixture
def wireless(db, product) -> Wireless:
    return Wireless.objects.create(
        wifi="wifi6 certificate",
        bluetooth="bluetooth certificate",
    )
