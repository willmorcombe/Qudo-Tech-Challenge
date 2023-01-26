from django.db import models
from accounts.models import User

# product model to attach to pre existing product data
class Products(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=10)
    price = models.IntegerField()
    quantity_in_stock = models.IntegerField()

    class Meta:
        db_table = 'products'
        managed = False

    # function for returning all product data to display
    @classmethod
    def get_all_data(self):
        return self.objects.all().order_by('name')

    @classmethod
    def get_single_product(self, pk):
        return self.objects.get(pk=pk)

# order model that has a one to many relationship with user
# could add time ordered and status fields for expation
class Orders(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

# order item model that can specify the quantity of a product
class OrderItems(models.Model):
    id = models.AutoField(primary_key=True)
    order = models.ForeignKey(Orders, on_delete=models.CASCADE)
    product = models.ForeignKey(Products, on_delete=models.CASCADE)
    quantity = models.IntegerField()
