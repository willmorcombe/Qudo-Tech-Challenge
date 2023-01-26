from django.contrib import admin
from .models import Orders, OrderItems, Products
# Register your models here.
admin.site.register(Orders)
admin.site.register(OrderItems)
admin.site.register(Products)
