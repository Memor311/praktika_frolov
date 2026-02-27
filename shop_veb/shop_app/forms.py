from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from .models import User, Role, Product, Review

class CustomUserRegistrationForm(UserCreationForm):
    phone = forms.CharField(max_length=20, required=False)
    telegram = forms.CharField(max_length=100, required=False)

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'phone', 'telegram', 'password1', 'password2')

    def save(self, commit=True):
        user = super().save(commit=False)
        # Назначаем роль "пользователь" по умолчанию
        user_role, _ = Role.objects.get_or_create(name='Пользователь')
        user.role = user_role
        if commit:
            user.save()
        return user

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['name', 'price', 'photo', 'category']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'price': forms.NumberInput(attrs={'class': 'form-control', 'step': '0.01'}),
            'category': forms.Select(attrs={'class': 'form-control'}),
            'photo': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }

class SiteReviewForm(forms.ModelForm):
    photos = forms.FileField(
        widget=forms.FileInput(attrs={
            'multiple': False,
            'class': 'form-control',
            'accept': 'image/*'
        }),
        required=False,
        label="Фотографии (можно выбрать несколько)"
    )

    class Meta:
        model = Review
        fields = ['text', 'score']
        widgets = {
            'text': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 4,
                'placeholder': 'Расскажите, как вам наш магазин?'
            }),
            'score': forms.Select(
                choices=[(i, f"{i} ★") for i in range(1, 6)],
                attrs={'class': 'form-control'}
            ),
        }
        labels = {
            'text': 'Ваш отзыв',
            'score': 'Оценка',
        }

class UserProfileForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email', 'phone', 'telegram']
        widgets = {
            'first_name': forms.TextInput(attrs={'class': 'form-control'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'phone': forms.TextInput(attrs={'class': 'form-control', 'placeholder': '+7 (999) 123-45-67'}),
            'telegram': forms.TextInput(attrs={'class': 'form-control', 'placeholder': '@username'}),
        }

class ReviewForm(forms.ModelForm):
    photos = forms.FileField(
        widget=forms.ClearableFileInput(attrs={
            'multiple': False,
            'accept': 'image/*',
            'class': 'form-control'
        }),
        required=False,
        label="Добавить фото"
    )

    class Meta:
        model = Review
        fields = ['text', 'score']
        widgets = {
            'text': forms.Textarea(attrs={'class': 'form-control', 'rows': 4}),
            'score': forms.Select(choices=[(i, f"{i} ★") for i in range(1, 6)], attrs={'class': 'form-control'}),
        }

class CustomAuthenticationForm(AuthenticationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['username'].widget.attrs.update({'class': 'form-control'})
        self.fields['password'].widget.attrs.update({'class': 'form-control'})