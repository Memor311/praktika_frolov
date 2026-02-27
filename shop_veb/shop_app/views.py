import csv

from django.db.models import Q, Sum, Avg, F
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.http import JsonResponse, HttpResponse
from .forms import CustomUserRegistrationForm, ProductForm, SiteReviewForm, UserProfileForm, ReviewForm, CustomAuthenticationForm
from shop_app.models import Product, Category, Order, Review, Status, ReviewPhoto, OrderProduct
from django.contrib.auth.views import LoginView
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from openpyxl import Workbook
from openpyxl.styles import Font, Alignment, PatternFill
from django.contrib.auth.decorators import user_passes_test

def admin_required(view_func):
    """
    Декоратор для проверки, что пользователь — администратор.
    """
    def check_admin(user):
        return user.is_authenticated and hasattr(user, 'role') and user.role.name == 'Администратор'
    
    return user_passes_test(check_admin, login_url='catalog')(view_func)



def index(request):
    reviews = Review.objects.all()
    return render(request, 'index.html', {'reviews': reviews})

@login_required
def add_site_review_view(request):
    if request.method == 'POST':
        form = SiteReviewForm(request.POST, request.FILES)
        if form.is_valid():
            # Сохраняем отзыв
            review = form.save(commit=False)
            review.user = request.user
            review.save()

            # Сохраняем фото (если есть)
            photos = request.FILES.getlist('photos')
            for photo in photos:
                ReviewPhoto.objects.create(review=review, photo=photo)

            messages.success(request, "Спасибо за ваш отзыв!")
            return redirect('index')
        else:
            messages.error(request, "Пожалуйста, исправьте ошибки.")
    else:
        form = SiteReviewForm()
    
    return render(request, 'add_site_review.html', {'form': form})


def catalog_view(request):
    products = Product.objects.select_related('category').all()
    category = Category.objects.all()
    search = request.GET.get('search','')
    if search:
        products=products.filter(name__icontains=search)
    filtered=request.GET.get('filter','')
    if filtered:
        products = products.filter(category_id=filtered)
    
    context ={
        'products': products,
        'category': category,
        'search': search,
        'filter': filtered,
    }
    return render(request, 'products/catalog.html', context)


def product_detail_view(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    return render(request, 'products/product_detail.html', {'product': product})

class CustomLoginView(LoginView):
    form_class = CustomAuthenticationForm
    template_name = 'login/login.html'
    redirect_authenticated_user = True

    def get_success_url(self):
        return reverse_lazy('catalog')

def register_view(request):
    if request.method == 'POST':
        form = CustomUserRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Аккаунт {username} успешно создан! Теперь вы можете войти.')
            return redirect('login')
        else:
            messages.error(request, 'Пожалуйста, исправьте ошибки в форме.')
    else:
        form = CustomUserRegistrationForm()
    return render(request, 'login/register.html', {'form': form})

# Главная админки
@admin_required
def admin_dashboard_view(request):
    return render(request, 'admin-panel/admin_dashboard.html')

# Товары
@admin_required
def admin_products_view(request):
    products = Product.objects.select_related('category').all()
    return render(request, 'admin-panel/admin_products.html', {'products': products})

# Заказы
@admin_required
def admin_orders_view(request):
    orders = Order.objects.select_related('user', 'status').prefetch_related('order_items__product')
    search_query = request.GET.get('search', '')
    if search_query:
        orders = orders.filter(
            Q(user__username__icontains=search_query) |
            Q(user__first_name__icontains=search_query) |
            Q(user__last_name__icontains=search_query)
        )

    date_from = request.GET.get('date_from')
    date_to = request.GET.get('date_to')
    if date_from:
        orders = orders.filter(created_at__gte=date_from)
    if date_to:
        orders = orders.filter(created_at__lte=date_to + ' 23:59:59')
    return render(request, 'admin-panel/admin_orders.html', {
        'orders': orders,
        'statuses': Status.objects.all(),
        'search_query': search_query,
        'date_from': date_from,
        'date_to': date_to,
    })

# Отзывы
@admin_required
def admin_reviews_view(request):
    reviews = Review.objects.select_related('user').prefetch_related('photos').order_by('-created_at')
    return render(request, 'admin-panel/admin_reviews.html', {'reviews': reviews})

@admin_required 
def add_product_view(request):
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            product = form.save(commit=False)
            product.creator = request.user  # текущий админ — создатель
            product.save()
            messages.success(request, f'Товар «{product.name}» успешно добавлен!')
            return redirect('admin-panel')
        else:
            messages.error(request, 'Пожалуйста, исправьте ошибки.')
    else:
        form = ProductForm()
    return render(request, 'admin-panel/add_product.html', {'form': form})


@admin_required
def edit_product_view(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()
            messages.success(request, f'Товар «{product.name}» обновлён!')
            return redirect('admin-panel')
        else:
            messages.error(request, 'Пожалуйста, исправьте ошибки.')
    else:
        form = ProductForm(instance=product)
    return render(request, 'admin-panel/edit_product.html', {'form': form, 'product': product})

@admin_required
def delete_product_view(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    product_name = product.name
    product.delete()
    messages.success(request, f'Товар «{product_name}» успешно удалён.')
    return redirect('admin-panel')

@admin_required
def create_order_view(request):
    if request.method == 'POST':
        address = request.POST.get('address')
        product_ids = request.POST.getlist('product_ids')  # список ID товаров
        counts = request.POST.getlist('counts')            # количество каждого

        # Создаём заказ
        order = Order.objects.create(
            user=request.user,
            address=address,
            status_id=1  # "Новый" — должен быть первым в таблице Status
        )

        # Добавляем товары
        for prod_id, count in zip(product_ids, counts):
            product = Product.objects.get(id=prod_id)
            OrderProduct.objects.create(
                order=order,
                product=product,
                count=int(count)
            )

        order.calculate_total()
        return redirect('order-success', order_id=order.id)

    # GET: показываем форму (или корзину)
    cart = request.session.get('cart', {})
    products = Product.objects.filter(id__in=cart.keys())
    return render(request, 'orders/create_order.html', {'products': products, 'cart': cart})


def order_detail_view(request, order_id):
    # Получаем заказ, проверяя, что он принадлежит текущему пользователю (или админу)
    order = get_object_or_404(Order, id=order_id)

    # Обычный пользователь может видеть только свои заказы
    if not request.user.is_admin and order.user != request.user:
        messages.error(request, "У вас нет доступа к этому заказу.")
        return redirect('catalog')

    return render(request, 'orders/order_detail.html', {'order': order})

@login_required
def delete_review_view(request, review_id):
    review = Review.objects.get(id=review_id)
    review.delete()
    return redirect('admin-panel')

def add_to_cart(request):
    if request.method == 'POST':
        product_id = request.POST.get('product_id')
        product = get_object_or_404(Product, id=product_id)

        # Инициализируем корзину в сессии
        cart = request.session.get('cart', {})

        # Увеличиваем количество или добавляем товар
        cart[product_id] = cart.get(product_id, 0) + 1

        # Сохраняем обратно в сессию
        request.session['cart'] = cart
        request.session.modified = True

        messages.success(request, f'«{product.name}» добавлен в корзину!')

    return redirect('catalog')  # или request.META.get('HTTP_REFERER', 'shop:catalog')


def cart_view(request):
    cart = request.session.get('cart', {})
    
    # Обработка действий
    if request.method == 'POST':
        product_id = request.POST.get('product_id')
        action = request.POST.get('action')
        
        if product_id in cart:
            if action == 'increase':
                cart[product_id] += 1
            elif action == 'decrease':
                if cart[product_id] > 1:
                    cart[product_id] -= 1
                else:
                    del cart[product_id]  # удаляем товар при количестве = 1
            elif action == 'remove':
                del cart[product_id]
            
            request.session['cart'] = cart
            request.session.modified = True
            return redirect('cart')  # перезагружаем страницу
    
    # Отображение корзины
    cart_items = []
    total = 0
    for product_id, count in cart.items():
        try:
            product = Product.objects.get(id=product_id)
            item_total = product.price * count
            cart_items.append({
                'product': product,
                'count': count,
                'total': item_total
            })
            total += item_total
        except Product.DoesNotExist:
            continue

    return render(request, 'cart.html', {
        'cart_items': cart_items,
        'total': total
    })

def checkout_view(request):
    if not request.user.is_authenticated:
        messages.error(request, "Для оформления заказа нужно войти в аккаунт.")
        return redirect('login')

    cart = request.session.get('cart', {})
    if not cart:
        messages.error(request, "Корзина пуста.")
        return redirect('cart')

    # Автозаполнение адреса из профиля
    initial_address = ""
    last_order = request.user.orders.order_by('-created_at').first()
    if last_order and last_order.address:
        initial_address = last_order.address

    if request.method == 'POST':
        address = request.POST.get('address', '').strip()
        if not address:
            messages.error(request, "Укажите адрес доставки.")
            return render(request, 'checkout.html', {'initial_address': initial_address})

        # Создаём заказ (как раньше)
        status_new = Status.objects.filter(name='Новый').first()
        if not status_new:
            status_new = Status.objects.create(name='Новый')

        order = Order.objects.create(
            user=request.user,
            address=address,
            status=status_new
        )

        for product_id, count in cart.items():
            try:
                product = Product.objects.get(id=product_id)
                OrderProduct.objects.create(order=order, product=product, count=int(count))
            except Product.DoesNotExist:
                continue

        order.calculate_total()
        request.session['cart'] = {}
        messages.success(request, f"Заказ №{order.id} успешно оформлен!")
        return redirect('order-detail', order_id=order.id)

    return render(request, 'checkout.html', {'initial_address': initial_address})

@login_required
def profile_view(request):
    if request.method == 'POST':
        form = UserProfileForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            messages.success(request, "Данные профиля обновлены!")
            return redirect('profile')
    else:
        form = UserProfileForm(instance=request.user)

    # Получаем заказы пользователя
    orders = request.user.orders.select_related('status').all().order_by('-created_at')

    return render(request, 'login/profile.html', {
        'form': form,
        'orders': orders
    })


def update_order_status_view(request, order_id):
    if request.method != 'POST':
        messages.error(request, "Недопустимый метод запроса.")
        return redirect('admin-panel')
    
    order = get_object_or_404(Order, id=order_id)
    status_id = request.POST.get('status_id')
    
    if not status_id:
        messages.error(request, "Статус не выбран.")
        return redirect('admin-orders')
    
    try:
        new_status = Status.objects.get(id=status_id)
        order.status = new_status
        order.save(update_fields=['status'])
        messages.success(request, f"Статус заказа #{order.id} обновлён на «{new_status.name}».")
    except Status.DoesNotExist:
        messages.error(request, "Указанный статус не существует.")
    
    return redirect('admin-orders')
    
    return redirect('admin-panel')

def sales_report_view(request):
    report_data = OrderProduct.objects.values(
        'product__id',
        'product__name',
        'product__price'
    ).annotate(
        total_quantity=Sum('count'),
        total_revenue=Sum(F('count') * F('product__price')),
        avg_per_order=Avg('count')
    ).order_by('-total_revenue')

    report = []
    for item in report_data:
        report.append({
            'product_name': item['product__name'],
            'total_quantity': item['total_quantity'] or 0,
            'total_revenue': float(item['total_revenue'] or 0),
            'avg_per_order': float(item['avg_per_order'] or 0)
        })

    if request.GET.get('export') == 'xlsx':
        return export_sales_report_xlsx(report)

    return render(request, 'admin-panel/sales_report.html', {'report': report})


def export_sales_report_xlsx(report):
    wb = Workbook()
    ws = wb.active
    ws.title = "Отчёт по продажам"

    headers = ['Товар', 'Количество покупок', 'Сумма (₽)', 'Среднее кол-во в заказе']
    ws.append(headers)

    header_font = Font(bold=True, color="FFFFFF")
    header_fill = PatternFill(start_color="366092", end_color="366092", fill_type="solid")

    for col in range(1, len(headers) + 1):
        ws.cell(row=1, column=col).font = header_font
        ws.cell(row=1, column=col).fill = header_fill
        ws.cell(row=1, column=col).alignment = Alignment(horizontal="center")

    for item in report:
        ws.append([
            item['product_name'],
            item['total_quantity'],
            item['total_revenue'],
            item['avg_per_order']
        ])

    for col in ws.columns:
        max_length = 0
        column = col[0].column_letter
        for cell in col:
            try:
                if len(str(cell.value)) > max_length:
                    max_length = len(str(cell.value))
            except:
                pass
        adjusted_width = min(max_length + 2, 50)

    response = HttpResponse(
        content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    )
    response['Content-Disposition'] = 'attachment; filename=sales_report.xlsx'
    wb.save(response)
    return response