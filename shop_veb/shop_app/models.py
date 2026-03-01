from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils import timezone
import os
import uuid

def review_photo_path(instance, filename):
    ext = filename.split('.')[-1]
    new_filename = f"review_{instance.review.id}_{uuid.uuid4().hex}.{ext}"
    return os.path.join('reviews', new_filename)

def product_photo_path(instance, filename):
    ext = filename.split('.')[-1]
    new_filename = f"product_{instance.id or 'tmp'}_{uuid.uuid4().hex}.{ext}"
    return os.path.join('products', new_filename)
    
class Role(models.Model):
    name = models.CharField(max_length=50, unique=True)


class User(AbstractUser):
    phone = models.CharField(max_length=20, blank=True, null=True)
    telegram = models.CharField(max_length=100, blank=True, null=True)
    created_at = models.DateTimeField(default=timezone.now)
    role = models.ForeignKey(Role, on_delete=models.PROTECT, related_name='users')
    
    @property
    def is_admin(self):
        return self.role and self.role.name == 'Администратор'

class Category(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name


class Product(models.Model):
    name = models.CharField(max_length=200)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    photo = models.ImageField(upload_to=product_photo_path, blank=True, null=True)
    category = models.ForeignKey(Category, on_delete=models.PROTECT, related_name='products')
    is_active = models.BooleanField(default=True, verbose_name="Активен")


class ProductAttribute(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='attributes')
    attribute_name = models.CharField(max_length=100)
    attribute_value = models.CharField(max_length=255)

    class Meta:
        unique_together = ('product', 'attribute_name')


class Status(models.Model):
    name = models.CharField(max_length=50, unique=True)

class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.PROTECT, related_name='orders')
    created_at = models.DateTimeField(default=timezone.now)
    total_price = models.DecimalField(max_digits=12, decimal_places=2, default=0)
    address = models.TextField(blank=True, null=True)
    status = models.ForeignKey('Status', on_delete=models.PROTECT, related_name='orders')

    def calculate_total(self):
        self.total_price = sum(
            item.product.price * item.count
            for item in self.order_items.all()
        )
        self.save(update_fields=['total_price'])

    def update_total_price(self):
        from django.db.models import Sum, F
        total = self.order_items.aggregate(
            total=Sum(F('count') * F('product__price'))
        )['total'] or 0
        self.total_price = total
        self.save(update_fields=['total_price'])

class OrderProduct(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='order_items')
    product = models.ForeignKey(Product, on_delete=models.PROTECT, related_name='order_products')
    count = models.PositiveIntegerField(default=1)

    @property
    def total_price(self):
        return self.product.price * self.count


class Review(models.Model):
    user = models.ForeignKey(User, on_delete=models.PROTECT, related_name='reviews')
    text = models.TextField(blank=True)
    score = models.PositiveSmallIntegerField(choices=[(i, i) for i in range(1, 6)])  # 1–5
    created_at = models.DateTimeField(default=timezone.now)

class ReviewPhoto(models.Model):
    review = models.ForeignKey(Review, on_delete=models.CASCADE, related_name='photos')
    photo = models.ImageField(upload_to=review_photo_path, blank=True, null=True)