from rest_framework import serializers

from .models import Products, Orders, OrderItems
from accounts.serializers import UserSerializer

class ProductSerializer(serializers.ModelSerializer):

    class Meta:
        model = Products # define user model
        fields = '__all__'


class OrderSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    quantity = serializers.IntegerField()
