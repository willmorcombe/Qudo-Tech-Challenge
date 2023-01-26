from rest_framework import serializers

from .models import Products, Orders, OrderItems
from accounts.models import User

class ProductSerializer(serializers.ModelSerializer):

    class Meta:
        model = Products # define user model
        fields = '__all__'

# custom serializer for order post request  data
class OrderSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    quantity = serializers.IntegerField()

# model serializer for serializing order items for order history
class OrderItemModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderItems
        fields = ['product', 'quantity']
        depth = 0
