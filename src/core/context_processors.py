from core.forms import SubscribeToNewsletter

def subscribe_form(request):
    subscriber_form = SubscribeToNewsletter(request.POST or None)
    return {
        "subscriber_form": subscriber_form
    }

