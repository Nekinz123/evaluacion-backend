from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm
from django.core.exceptions import PermissionDenied
from django.shortcuts import render, redirect, get_object_or_404
from cuentas.forms import RegistroForm, UsuarioCrearForm, UsuarioEditarForm
from cuentas.models import Usuario


def login_view(request):
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            login(request, form.get_user())
            return redirect('panel')
    else:
        form = AuthenticationForm()
    return render(request, 'cuentas/login.html', {'form': form})


def register(request):
    if request.method == 'POST':
        form = RegistroForm(request.POST)
        if form.is_valid():
            usuario = form.save(commit=False)
            usuario.rol = 'turista'
            usuario.save()
            login(request, usuario)
            return redirect('panel')
    else:
        form = RegistroForm()
    return render(request, 'cuentas/register.html', {'form': form})


def logout_view(request):
    logout(request)
    return redirect('login')


# ---------- Gestión de usuarios (solo administrador) ----------

@login_required
def usuarios(request):
    if request.user.rol != 'admin':
        raise PermissionDenied
    lista = Usuario.objects.all()
    return render(request, 'cuentas/usuarios.html', {'usuarios': lista})


@login_required
def usuario_nuevo(request):
    if request.user.rol != 'admin':
        raise PermissionDenied
    if request.method == 'POST':
        form = UsuarioCrearForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('usuarios')
    else:
        form = UsuarioCrearForm()
    return render(request, 'form.html', {'form': form, 'titulo': 'Nuevo usuario', 'volver': 'usuarios'})


@login_required
def usuario_editar(request, id):
    if request.user.rol != 'admin':
        raise PermissionDenied
    usuario = get_object_or_404(Usuario, id=id)
    if request.method == 'POST':
        form = UsuarioEditarForm(request.POST, instance=usuario)
        if form.is_valid():
            form.save()
            return redirect('usuarios')
    else:
        form = UsuarioEditarForm(instance=usuario)
    return render(request, 'form.html', {'form': form, 'titulo': 'Editar usuario', 'volver': 'usuarios'})


@login_required
def usuario_eliminar(request, id):
    if request.user.rol != 'admin':
        raise PermissionDenied
    usuario = get_object_or_404(Usuario, id=id)
    if usuario == request.user:
        return redirect('usuarios')
    if request.method == 'POST':
        usuario.delete()
        return redirect('usuarios')
    return render(request, 'confirmar_eliminar.html', {'objeto': usuario, 'volver': 'usuarios'})
