from typing import Callable
from django.http import HttpRequest, HttpResponse
from django.contrib.auth.models import Group
from django.core.exceptions import PermissionDenied
from django.contrib.auth import get_user_model


UserModel = get_user_model()


class BlacklistMiddleware:
    def __init__(
        self, get_response: Callable[[HttpRequest], HttpResponse]
    ) -> None:
        self.get_response = get_response

    def __call__(self, request: HttpRequest) -> HttpResponse:
        self.handle_request(request)
        response = self.get_response(request)
        self.handle_response(response)

        return response

    def handle_request(self, request: HttpRequest) -> None:
        # if request.session.get("user"):
        #     user = request.session.get("user")
        # else:
        #     user = request.user
        user = request.session.get("user")
        if not user:
            return

        blacklist, _ = Group.objects.get_or_create(name="Blacklist")

        if blacklist.user_set.filter(email=user["userinfo"]["email"]).exists():
            raise PermissionDenied()

    def handle_response(self, response: HttpResponse) -> None:
        ...