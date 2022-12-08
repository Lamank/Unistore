from django.urls import path
from django.contrib.auth import views as auth_views
from django.urls import reverse_lazy

from . import views

app_name = 'users'

urlpatterns = [
    path('wishlist/', views.wishlist, name='wishlist'),
    path('checkout/', views.checkout, name="checkout"),
    path('order-success', views.order_success, name="order-success"),
    path('user-login/', views.LoginView.as_view(), name='user-login'),
    path('register/', views.register, name='register'),
    path("login-user/", views.login_user, name="login"),
    path("auth-callback/", views.auth_callback, name="auth-callback"),
    path("logout/", views.logout, name="logout"),
    path('password-change/', views.PasswordsChangeView.as_view(template_name="core/change-password.html"), name='password-change'),

    path("password-reset/", views.custom_password_reset, name="password_reset"),

    path('password-reset/done/', 
        auth_views.PasswordResetDoneView.as_view(
            template_name='users/password/password_reset_done.html'), 
        name='password_reset_done'),

    path('password-reset-confirm/<uidb64>/<token>/', 
        auth_views.PasswordResetConfirmView.as_view(
            template_name="users/password/password_reset_confirm.html",
            success_url = reverse_lazy("users:password_reset_complete")), 
        name='password_reset_confirm'),

    path('reset-done/', 
        views.password_reset_complete,
        name='password_reset_complete'),     

    path('activate/<uidb64>/<token>', views.activate, name='activate'),

    # path('password-confirm')

]
