from django.shortcuts import render
from django.contrib.auth import authenticate
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authentication import get_authorization_header
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated
from rest_framework import exceptions

from .models import Products, Orders, OrderItems
from .serializers import ProductSerializer, OrderSerializer



class ProductView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        products = Products.get_all_data() # should I do this or is this a vunrability?

        ProductSerializer(products, many=True)
        return Response(serializer.data)

# view to provide single product info
class ProductDetialView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, pk):
        product = Products.get_single_product(pk=pk) # should I do this or is this a vunrability?

        serializer = ProductSerializer(product, many=False)
        return Response(serializer.data)

class OrderView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        # serialize input
        order_serializer = OrderSerializer(data = request.data)
        order_serializer.is_valid(raise_exception=True)

        # retrieve objects for order creation
        product = Products.get_single_product(pk=order_serializer.data['id'])
        user = request.user
        product_quantity = order_serializer.data['quantity']

        # create new order for user
        order = Orders.objects.create(user=user)
        order_items = OrderItems.objects.create(order=order, product=product, quantity=product_quantity)

        #



        return Response({'message' : 'Successfully purchased product', 'product' : ProductSerializer(product, many=False).data})