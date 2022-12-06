from blog.models import Comment, Blog, Tag
from core.models import Subscriber, Contact
from product.models import Product, Category, Brand, Discount, Screen, ProductReview, Logo, Media, Display, Wireless
from users.models import User, Wishlist, Cart, CartItem, Order, OrderItem

class TestBlogModel():
    def test_blog_return_correct_str(self, blog):
        assert blog.__str__() == 'blog_title'

    def test_blog_model(self, blog):
        assert isinstance(blog, Blog)

    def test_comment_model(self, comment):
        assert isinstance(comment, Comment)

    def test_tag_model(self, tag):
        assert isinstance(tag, Tag)

class TestCoreModel():
    def test_subscriber_model(self, subscriber):
        assert isinstance(subscriber, Subscriber)

    def test_contact_model(self, contact):
        assert isinstance(contact, Contact)

    def test_subscriber_return_correct_str(self, subscriber):
        assert subscriber.__str__() == 'test@gmail.com'

    def test_contact_return_coreect_str(self, contact):
        assert contact.__str__() == 'test@gmail.com'



class TestProductModels:

	def test_category_model(self, category) -> None:
		assert isinstance(category, Category)
	
	def test_cateogory_returns_correct_str(self, category) -> None:
		assert category.__str__() == "mobile phone"

	def test_brand_model(self, brand) -> None:
		assert isinstance(brand, Brand)
	
	def test_brand_returns_correct_str(self, brand) -> None:
		assert brand.__str__() == "Asus"

	def test_discount_model(self, discount) -> None:
		assert isinstance(discount, Discount)
	
	def test_discount_returns_correct_str(self, discount) -> None:
		assert discount.__str__() == "15"

	def test_screen_model(self, screen) -> None:
		assert isinstance(screen, Screen)

	def test_screen_returns_correct_str(self, screen) -> None:
		assert screen.__str__() == "16"
	
	def test_product_review_model(self, product_review) -> None:
		assert isinstance(product_review, ProductReview)

	def test_product_review_returns_correct_str(self, product_review) -> None:
		assert product_review.__str__() == "I like it..."

	def test_product_model(self, product) -> None:
		assert isinstance(product, Product)
	
	def test_product_returns_correct_str(self, product) -> None:
		assert product.__str__() == "Hi"
	
	def test_logo_model(self, logo: Logo) -> None:
		assert isinstance(logo, Logo)
	
	def test_logo_model_returns_correct_str(self, logo: Logo) -> None:
		assert logo.__str__() == "/img/uploads/%Y/%m/%d/Apple"

	def test_media_model(self, media: Media) -> None:
		assert isinstance(media, Media)
	
	def test_media_model_returns_correct_str(self, media: Media) -> None:
		assert media.__str__() == "/img/uploads/%Y/%m/%d/Laptop%20photo"
	
	def test_display_model(self, display: Display) -> None:
		assert isinstance(display, Display)

	def test_display_model_returns_correct_str(self, display: Display) -> None:
		assert display.__str__() == "17 inch"
	
	def test_wireless_model(self, wireless: Wireless) -> None:
		assert isinstance(wireless, Wireless)
	
	def test_wireless_model_returns_correct_str(self, wireless: Wireless) -> None:
		assert wireless.__str__() == "wifi6 certificate bluetooth certificate"

class TestUserModels:

	def test_user_model(self, user) -> None:
		assert isinstance(user, User)
	
	def test_user_returns_correct_str(self, user) -> None:
		assert user.__str__() == "akbar@gmail.com"

	def test_wishlist_model(self, wishlist) -> None:
		assert isinstance(wishlist, Wishlist)
	
	def test_wishlist_returns_correct_str(self, wishlist) -> None:
		assert wishlist.__str__() == "akbar@gmail.com Hi"

	def test_cart_model(self, cart) -> None:
		assert isinstance(cart, Cart)
	
	def test_cart_returns_correct_str(self, cart) -> None:
		assert cart.__str__() == "akbar@gmail.com"

	def test_cart_item_model(self, cart_item) -> None:
		assert isinstance(cart_item, CartItem)
	
	def test_cart_item_returns_correct_str(self, cart_item) -> None:
		assert cart_item.__str__() == "akbar@gmail.com"

	def test_order_model(self, order) -> None:
		assert isinstance(order, Order)
	
	def test_order_returns_correct_str(self, order) -> None:
		assert order.__str__() == "akbar@gmail.com"

	def test_order_item_model(self, order_item) -> None:
		assert isinstance(order_item, OrderItem)

	def test_order_item_returns_correct_str(self, order_item) -> None:
		assert order_item.__str__() == "akbar@gmail.com"
