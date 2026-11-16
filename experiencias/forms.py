from django import forms

from core.forms import BootstrapForm
from .models import Categoria, Experiencia


class CategoriaForm(BootstrapForm, forms.ModelForm):
    class Meta:
        model = Categoria
        fields = ['nombre', 'descripcion', 'activo']


class ExperienciaForm(BootstrapForm, forms.ModelForm):
    class Meta:
        model = Experiencia
        fields = ['titulo', 'descripcion', 'categoria', 'precio', 'cupo_maximo', 'fecha_hora']
        widgets = {
            'fecha_hora': forms.DateTimeInput(attrs={'type': 'datetime-local'}, format='%Y-%m-%dT%H:%M'),
        }
