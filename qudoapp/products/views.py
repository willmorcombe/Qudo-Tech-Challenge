from django.shortcuts import render
from django.contrib.auth import authenticate
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authentication import get_authorization_header
from rest_framework.permissions import IsAuthenticated
from rest_framework import exceptions

from .models import Products, Orders, OrderItems
from .serializers import ProductSerializer, OrderSerializer, OrderItemModelSerializer



class ProductView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        products = Products.get_all_data() # should I do this or is this a vunrability?

        serializer = ProductSerializer(products, many=True)
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

        #check to see if order can be placed
        product_quantity = ProductSerializer(product, many=False).data['quantity_in_stock']
        order_quantity = order_serializer.data['quantity']

        if int(order_quantity) > int(product_quantity):
            return Response({'message' : 'Order cannot be placed, not enough items in stock'})

        else:
            # create new order for user
            order = Orders.objects.create(user=user)
            order_items = OrderItems.objects.create(order=order, product=product, quantity=order_quantity)

            # update stock
            product.quantity_in_stock = int(product_quantity) - int(order_quantity)
            product.save()

            return Response({'message' : 'Successfully purchased product', 'product' : ProductSerializer(product, many=False).data})


class OrderHistoryView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):

        user = request.user
        orders = Orders.objects.filter(user = user)
        order_items = OrderItems.objects.filter(order__in=orders)
        history_serializer = OrderItemModelSerializer(order_items, many=True)
        history_data = history_serializer.data

        data = {
            'user' : request.user.email,
            'item details' : history_serializer.data
        }



        return Response(data)
