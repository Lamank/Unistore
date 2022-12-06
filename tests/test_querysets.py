from django.db.models import QuerySet
from django.contrib.auth import get_user_model
from blog.services.blog import last_six_blogs, searched_blog, most_popular_blog, get_comment, get_blog_from_tag, get_tags_from_blog
from product.services.products import similar_product, product_for_brand, product_for_category, get_product_categories, product_list, get_product_screen_size, get_product_brand, get_reviews, search_product, get_specific_product, get_discount_price, get_four_desktops, get_four_hybrid_devices, get_four_tablets
from users.services.user import create_user_if_not_exist

User = get_user_model()

class TestBlogServices:

	def test_last_six_blog(self) -> None:
		posts = last_six_blogs()
		assert isinstance(posts, QuerySet)

	def test_search_blog(self) -> None:
		data = "apple m2 laptop"
		search_blog = searched_blog(data=data)
		assert isinstance(search_blog, QuerySet)

	def test_popular_blog(self):
		popular_blog = most_popular_blog()
		assert isinstance(popular_blog, QuerySet)

	def test_get_comment(self) -> None:
		comments = get_comment(blog_id=1)
		assert isinstance(comments, QuerySet)
	
	# def test_get_blog_from_tag(self, tag, db) -> None:
	# 	blogs = get_blog_from_tag(blog_tag="M2 macbooks")
	# 	assert isinstance(blogs, QuerySet)
	
	def test_get_tags_from_blog(self) -> None:
		tags = get_tags_from_blog(blog_id=1)
		assert isinstance(tags, QuerySet)

class TestProductServices:

	def test_similar_product(self, service_product) -> None:
		simil_product = similar_product(product=service_product)
		assert isinstance(simil_product, QuerySet)
	
	def test_product_for_brand(self, service_brand) -> None:
		for_brand = product_for_brand(brand_name=service_brand)
		assert isinstance(for_brand, QuerySet)

	def test_product_for_category(self, service_category) -> None:
		for_category = product_for_category(category=service_category)
		assert isinstance(for_category, QuerySet)
	
	def test_get_product_categories(self) -> None:
		assert isinstance(get_product_categories(), QuerySet)
	
	def test_product_list(self) -> None:
		assert isinstance(product_list(), QuerySet)
	
	def test_get_product_screen_size(self) -> None:
		assert isinstance(get_product_screen_size(), QuerySet)
	
	def test_get_product_brand(self) -> None:
		assert isinstance(get_product_brand(), QuerySet)

	def test_get_reviews(self, service_product) -> None:
		reviews = get_reviews(product_id=service_product.id)
		assert isinstance(reviews, QuerySet)
	
	def test_search_product(self, service_product) -> None:
		data = "M2 macbooks"
		searched_product = search_product(data=data)
		assert isinstance(searched_product, QuerySet)
	
	def test_get_specific_product(self, db) -> None:
		slug = "M2 macbooks"
		specific_product = get_specific_product(slug=slug)
		assert isinstance(specific_product, QuerySet)
	
	def test_get_discount_price(self, service_product) -> None:
		discount_price = get_discount_price(service_product.price, service_product.discount)
		assert discount_price == 1100

	def test_get_four_desktops(self) -> None:
		desktops = get_four_desktops()
		assert isinstance(desktops, QuerySet)
	
	def test_get_four_hybrid_devices(self) -> None:
		devices = get_four_hybrid_devices()
		assert isinstance(devices, QuerySet)

	def test_get_four_tablets(self) -> None:
		tablets = get_four_tablets()
		assert isinstance(tablets, QuerySet)

class TestUserServices:

	def test_create_user_if_not_exist(self, user) -> None:
		created_user = create_user_if_not_exist(
			email=user.email, 
			first_name=user.username,
			last_name=user.username + " Hasanov",
		)

		assert isinstance(created_user, User)

	def test_user_returns_correct_data(self, user) -> None:
		created_user = create_user_if_not_exist(
			email=user.email, 
			first_name=user.username,
			last_name=user.username + " Hasanov",
		)

		assert created_user.email == user.email
