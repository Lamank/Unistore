from django.core import mail

def test_an_admin_view(admin_client) -> None:
    response = admin_client.get('/admin/')
    assert response.status_code == 200

def test_an_admin_rosetta_view(admin_client) -> None:
    response = admin_client.get('/rosetta/files/project/')
    assert response.status_code == 200

def test_a_client_rosetta_view(client) -> None:
    response = client.get('/rosetta/files/project/')
    assert response.status_code == 302

# def test_an_authenticated_view(admin_client) -> None:
#     response = admin_client.get('/az/')
#     assert response.status_code == 200

def test_an_authenticated_client_admin_view(client, django_user_model):
    username = "user1"
    email = "user1@gmail.com"
    password = "bar"
    user = django_user_model.objects.create_user(username=username, email=email, password=password)
    client.force_login(user)
    response = client.get('/admin')
    assert response.status_code == 302

# def test_a_client_view(client, db) -> None:
#     response = client.get('/en/')
#     assert response.status_code == 200

def test_a_client_product_view(client, db) -> None:
    response = client.get('/products/')
    assert response.status_code == 200

# def test_a_client_blog_view(client, db) -> None:
#     response = client.get('/blog/')
#     assert response.status_code == 200

def test_a_client_404_view(client, db) -> None:
    response = client.get('/fnlafsmka')
    assert response.status_code == 404

def test_with_client_response_content(client, db) -> None:
    response = client.get('/')
    assert response.content != 'Not a something else'

def test_a_client_admin_view(client) -> None:
    response = client.get('/admin/')
    assert response.status_code == 302

def test_with_authenticated_client(client, django_user_model):
    username = "user1"
    email = "user1@gmail.com"
    password = "bar"
    user = django_user_model.objects.create_user(username=username, email=email, password=password)
    client.force_login(user)
    response = client.get('/sjnkdakd')
    assert b'<title>Not Found</title>' in response.content

def test_an_authenticated_client_admin_view(client, django_user_model):
    username = "user1"
    email = "user1@gmail.com"
    password = "bar"
    user = django_user_model.objects.create_user(username=username, email=email, password=password)
    client.force_login(user)
    response = client.get('/admin/')
    assert response.status_code == 302

def test_new_user(django_user_model):
    user = django_user_model.objects.create(username="someone", email="someone@gmail.com", password="something")
    assert user.username == "someone"
    assert user.password == "something"
    assert user.email == "someone@gmail.com"

def test_new_user_login(django_user_model):
    user = django_user_model.objects.create(username="someone", email="someone@gmail.com", password="something")
    assert user.is_authenticated == True

def test_mail(mailoutbox):
    mail.send_mail('subject', 'body', 'from@example.com', ['to@example.com'])
    assert len(mailoutbox) == 1

def test_mail_content(mailoutbox):
    mail.send_mail('subject', 'body', 'from@example.com', ['to@example.com'])
    m = mailoutbox[0]
    assert m.subject == 'subject'
    assert m.body == 'body'
    assert m.from_email == 'from@example.com'
    assert list(m.to) == ['to@example.com']

def test_with_specific_settings(settings):
    settings.USE_TZ = True
    assert settings.USE_TZ

def test_with_debug_settings(settings):
    settings.DEBUG = True
    assert settings.DEBUG
