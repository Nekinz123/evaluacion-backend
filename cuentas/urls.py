from django.urls import path
from cuentas.views import login_view, register, logout_view, usuarios, usuario_nuevo, usuario_editar, usuario_eliminar

urlpatterns = [
    path('login/', login_view, name='login'),
    path('register/', register, name='register'),
    path('logout/', logout_view, name='logout'),

    path('usuarios/', usuarios, name='usuarios'),
    path('usuarios/nuevo/', usuario_nuevo, name='usuario_nuevo'),
    path('usuarios/<int:id>/editar/', usuario_editar, name='usuario_editar'),
    path('usuarios/<int:id>/eliminar/', usuario_eliminar, name='usuario_eliminar'),
]
