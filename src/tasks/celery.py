import os

from celery import Celery
from celery.schedules import crontab

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'unistore.settings')

app = Celery('unistore', include=["tasks.tasks"])
app.config_from_object('django.conf:settings', namespace='CELERY')


app.conf.beat_schedule = {
    'send_new_product_notification': {
        'task': 'tasks.tasks.notifications.send_new_product_notifications',
        'schedule': crontab(minute='01', hour='17', day_of_week='thu,fri'),

 
    },
    'send_popular_products_to_subscribers': {
        'task': 'tasks.tasks.notifications.send_popular_products_to_subscribers',
        'schedule': crontab(minute='01', hour='17', day_of_week='mon'),
        
    }
}

app.autodiscover_tasks()

# celery -A tasks.celery worker -l INFO