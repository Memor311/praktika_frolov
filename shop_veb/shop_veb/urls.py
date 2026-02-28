"""
URL configuration for shop_veb project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/6.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.auth.views import LogoutView
from django.urls import path
from shop_app import views

urlpatterns = [
    path('admin/', admin.site.urls),

    #Админ-панель
    path('admin-panel/', views.admin_dashboard_view, name='admin-panel'),
    path('admin-panel/sales-report/', views.sales_report_view, name='sales-report'),
    #Товары
    path('admin-panel/products/', views.admin_products_view, name='admin-products'),
    path('admin-panel/product/add/', views.add_product_view, name='add-product'),
    path('admin-panel/product/<int:product_id>/edit/', views.edit_product_view, name='edit-product'),
    path('admin-panel/product/<int:product_id>/change/', views.delete_product_view, name='change-product'),
    #Заказы
    path('admin-panel/orders/', views.admin_orders_view, name='admin-orders'),
    path('admin-panel/order/<int:order_id>/update-status/', views.update_order_status_view, name='update-order-status'),
    path('admin-panel/order/<int:order_id>/', views.admin_order_detail, name='admin_order-detail'),
    #Отзывы
    path('admin-panel/reviews/', views.admin_reviews_view, name='admin-reviews'),
    path('admin-panel/review/<int:review_id>/delete/', views.delete_review_view, name='delete-review'),

    #Обычные страницы
    path('catalog/', views.catalog_view, name="catalog"),
    path('', views.index, name="index"),

    #Работа с пользователем
    path('register/', views.register_view, name='register'),
    path('login/', views.CustomLoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(next_page='index'), name='logout'),
    path('profile/', views.profile_view, name='profile'),
   
    #Корзина
    path('cart/add/', views.add_to_cart, name='add-to-cart'),
    path('cart/', views.cart_view, name='cart'),
    path('checkout/', views.checkout_view, name='checkout'),


    path('review/add/', views.add_site_review_view, name='add-site-review'),
    path('order/create/', views.create_order_view, name='create-order'),
    path('order/<int:order_id>/', views.order_detail_view, name='order-detail'),
    path('product/<int:product_id>/', views.product_detail_view, name='product-detail'),
   


]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)