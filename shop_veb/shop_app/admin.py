from django.contrib import admin
from .models import Product, Attribute, ProductAttribute

# Register your models here.
class ProductAttributeInline(admin.TabularInline):
    model = ProductAttribute
    extra = 1
    fields = ['attribute', 'value']

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    inlines = [ProductAttributeInline]
    list_display = ['name', 'category', 'price', 'is_active']

@admin.register(Attribute)
class AttributeAdmin(admin.ModelAdmin):
    list_display = ['name']
    search_fields = ['name']