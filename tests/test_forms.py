from core.forms import ContactForm, SubscribeToNewsletter
from product.forms import ProductReviewForm
from users.forms import RegisterForm, LoginForm
from blog.forms import BlogCommentForm

class TestForms:

    def test_contact_form_valid_data(self, form_with_valid_data: ContactForm) -> None:
        form = form_with_valid_data

        assert form.is_valid() == True
    
    def test_contact_form_invalid_data(self, form_with_invalid_data: ContactForm) -> None:
        form = form_with_invalid_data

        assert form.is_valid() == False

    def test_product_review_form_valid_data(self, product_review_form_with_valid_data: ProductReviewForm) -> None:
        form = product_review_form_with_valid_data
        
        assert form.is_valid() == True

    def test_product_review_form_invalid_data(self, product_review_form_with_invalid_data: ProductReviewForm) -> None:
        form = product_review_form_with_invalid_data
        
        assert form.is_valid() == False
    
    def test_register_form_valid_data(self, register_form_with_valid_data: RegisterForm) -> None:
        form = register_form_with_valid_data

        assert form.is_valid() == True
    
    def test_register_form_invalid_data(self, register_form_with_invalid_data: RegisterForm) -> None:
        form = register_form_with_invalid_data

        assert form.is_valid() == False

    def test_subscribe_to_newsletter_form_valid_data(self, subscribe_to_newsletter_form_with_valid_data: SubscribeToNewsletter) -> None:
        form = subscribe_to_newsletter_form_with_valid_data

        assert form.is_valid() == True

    def test_subscribe_to_newsletter_form_invalid_data(self, subscribe_to_newsletter_form_with_invalid_data: SubscribeToNewsletter) -> None:
        form = subscribe_to_newsletter_form_with_invalid_data

        assert form.is_valid() == False

    def test_blog_comment_form_valid_data(self, blog_comment_form_with_valid_data: BlogCommentForm) -> None:
        form = blog_comment_form_with_valid_data

        assert form.is_valid() == True

    def test_blog_comment_form_invalid_data(self, blog_comment_form_with_invalid_data: BlogCommentForm) -> None:
        form = blog_comment_form_with_invalid_data

        assert form.is_valid() == False

    def test_login_form_invalid_data(self, login_form_with_invalid_data: LoginForm) -> None:
        form = login_form_with_invalid_data

        assert form.is_valid() == False

    # def test_login_form_valid_data(self, login_form_with_valid_data: LoginForm) -> None:
    #     form = login_form_with_valid_data

    #     assert form.is_valid() == True
