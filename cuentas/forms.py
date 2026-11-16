from django import forms
from django.contrib.auth.forms import UserCreationForm

from core.forms import BootstrapForm
from .models import Usuario


class RegistroForm(UserCreationForm):
    class Meta:
        model = Usuario
        fields = ['username', 'first_name', 'last_name', 'email']


class UsuarioCrearForm(BootstrapForm, UserCreationForm):
    class Meta:
        model = Usuario
        fields = ['username', 'first_name', 'last_name', 'email', 'rol']


class UsuarioEditarForm(BootstrapForm, forms.ModelForm):
    class Meta:
        model = Usuario
        fields = ['username', 'first_name', 'last_name', 'email', 'rol', 'is_active']
