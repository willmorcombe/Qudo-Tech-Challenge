from django.db import models
from django.contrib.auth.models import AbstractUser

from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver
from rest_framework.authtoken.models import Token


class User(AbstractUser):
    email = models.CharField(max_length=255, unique=True)
    password = models.CharField(max_length=255)

    first_name = None
    last_name = None

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []


class Products(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=10)
    price = models.IntegerField()
    quantity_in_stock = models.IntegerField()

    class Meta:
        db_table = 'products'
        managed = False


    # function for returning all product data to display in list
    @classmethod
    def getAllData(self):
        return [[data['id'], data['name'], data['price'], data['quantity_in_stock']] for data in self.objects.all().values()]


@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)
