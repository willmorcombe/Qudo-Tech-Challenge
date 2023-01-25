from django.urls import path
from . import views

urlpatterns = [
    path('', views.ProductView.as_view(), name='all'),
    path('<str:pk>', views.ProductDetialView.as_view(), name='product'),
    path('order/', views.OrderView.as_view(), name='order')
]
