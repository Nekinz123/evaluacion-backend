from django.urls import path
from experiencias.views import (
    categorias, categoria_nueva, categoria_editar, categoria_eliminar,
    experiencias, experiencia_nueva, experiencia_editar, experiencia_eliminar,
    catalogo, inscribir, mis_reservas, cancelar_reserva, reservas
)

urlpatterns = [
    path('categorias/', categorias, name='categorias'),
    path('categorias/nuevacategoria_nueva/', categoria_nueva, name='categoria_nueva'),
    path('categorias/<int:id>/editar/', categoria_editar, name='categoria_editar'),
    path('categorias/<int:id>/eliminar/', categoria_eliminar, name='categoria_eliminar'),

    path('experiencias/', experiencias, name='experiencias'),
    path('experiencias/nueva/', experiencia_nueva, name='experiencia_nueva'),
    path('experiencias/<int:id>/editar/', experiencia_editar, name='experiencia_editar'),
    path('experiencias/<int:id>/eliminar/', experiencia_eliminar, name='experiencia_eliminar'),

    path('catalogo/', catalogo, name='catalogo'),
    path('catalogo/<int:id>/inscribir/', inscribir, name='inscribir'),
    path('mis-reservas/', mis_reservas, name='mis_reservas'),
    path('mis-reservas/<int:id>/cancelar/', cancelar_reserva, name='cancelar_reserva'),

    path('reservas/', reservas, name='reservas'),
]
