from django.urls import path
from . import views

urlpatterns = [
    path('', views.ProductView.as_view(), name='all-products'),
    path('<str:pk>', views.ProductDetialView.as_view(), name='product-detail'),
    path('order/', views.OrderView.as_view(), name='order'),
    path('order/history', views.OrderHistoryView.as_view(), name='order-history')
]
