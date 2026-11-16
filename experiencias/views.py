from django.contrib.auth.decorators import login_required
from django.core.exceptions import PermissionDenied
from django.shortcuts import render, redirect, get_object_or_404

from experiencias.forms import CategoriaForm, ExperienciaForm
from experiencias.models import Categoria, Experiencia, Inscripcion

@login_required
def categorias(request):
    if request.user.rol != 'admin':
        raise PermissionDenied
    lista = Categoria.objects.all()
    return render(request, 'experiencias/categorias.html', {'categorias': lista})


@login_required
def categoria_nueva(request):
    if request.user.rol != 'admin':
        raise PermissionDenied
    if request.method == 'POST':
        form = CategoriaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('categorias')
    else:
        form = CategoriaForm()
    return render(request, 'form.html', {'form': form, 'titulo': 'Nueva categoría', 'volver': 'categorias'})


@login_required
def categoria_editar(request, id):
    if request.user.rol != 'admin':
        raise PermissionDenied
    categoria = get_object_or_404(Categoria, id=id)
    if request.method == 'POST':
        form = CategoriaForm(request.POST, instance=categoria)
        if form.is_valid():
            form.save()
            return redirect('categorias')
    else:
        form = CategoriaForm(instance=categoria)
    return render(request, 'form.html', {'form': form, 'titulo': 'Editar categoría', 'volver': 'categorias'})


@login_required
def categoria_eliminar(request, id):
    if request.user.rol != 'admin':
        raise PermissionDenied
    categoria = get_object_or_404(Categoria, id=id)
    if request.method == 'POST':
        categoria.delete()
        return redirect('categorias')
    return render(request, 'confirmar_eliminar.html', {'objeto': categoria, 'volver': 'categorias'})


@login_required
def experiencias(request):
    if request.user.rol == 'turista':
        raise PermissionDenied
    if request.user.rol == 'admin':
        lista = Experiencia.objects.all()
    else:
        lista = Experiencia.objects.filter(creador=request.user)
    return render(request, 'experiencias/experiencias.html', {'experiencias': lista})


@login_required
def experiencia_nueva(request):
    if request.user.rol == 'turista':
        raise PermissionDenied
    if request.method == 'POST':
        form = ExperienciaForm(request.POST)
        if form.is_valid():
            experiencia = form.save(commit=False)
            experiencia.creador = request.user
            experiencia.save()
            return redirect('experiencias')
    else:
        form = ExperienciaForm()
    return render(request, 'form.html', {'form': form, 'titulo': 'Nueva experiencia', 'volver': 'experiencias'})


@login_required
def experiencia_editar(request, id):
    if request.user.rol == 'turista':
        raise PermissionDenied
    if request.user.rol == 'admin':
        experiencia = get_object_or_404(Experiencia, id=id)
    else:
        experiencia = get_object_or_404(Experiencia, id=id, creador=request.user)
    if request.method == 'POST':
        form = ExperienciaForm(request.POST, instance=experiencia)
        if form.is_valid():
            form.save()
            return redirect('experiencias')
    else:
        form = ExperienciaForm(instance=experiencia)
    return render(request, 'form.html', {'form': form, 'titulo': 'Editar experiencia', 'volver': 'experiencias'})


@login_required
def experiencia_eliminar(request, id):
    if request.user.rol != 'admin':
        raise PermissionDenied
    experiencia = get_object_or_404(Experiencia, id=id)
    if request.method == 'POST':
        experiencia.delete()
        return redirect('experiencias')
    return render(request, 'confirmar_eliminar.html', {'objeto': experiencia, 'volver': 'experiencias'})


@login_required
def catalogo(request):
    if request.user.rol != 'turista':
        raise PermissionDenied
    lista = Experiencia.objects.filter(categoria__activo=True)
    return render(request, 'experiencias/catalogo.html', {'experiencias': lista})


@login_required
def inscribir(request, id):
    if request.user.rol != 'turista':
        raise PermissionDenied
    if request.method != 'POST':
        return redirect('catalogo')
    experiencia = get_object_or_404(Experiencia, id=id, categoria__activo=True)

    error = None
    if Inscripcion.objects.filter(usuario=request.user, experiencia=experiencia).exists():
        error = 'Ya estás inscrito en esta experiencia.'
    elif Inscripcion.objects.filter(experiencia=experiencia).count() >= experiencia.cupo_maximo:
        error = 'No quedan cupos disponibles.'

    if error:
        lista = Experiencia.objects.filter(categoria__activo=True)
        return render(request, 'experiencias/catalogo.html', {'experiencias': lista, 'error': error})

    Inscripcion.objects.create(usuario=request.user, experiencia=experiencia)
    return redirect('mis_reservas')


@login_required
def mis_reservas(request):
    if request.user.rol != 'turista':
        raise PermissionDenied
    lista = Inscripcion.objects.filter(usuario=request.user)
    return render(request, 'experiencias/mis_reservas.html', {'reservas': lista})


@login_required
def cancelar_reserva(request, id):
    if request.user.rol != 'turista':
        raise PermissionDenied
    reserva = get_object_or_404(Inscripcion, id=id, usuario=request.user)
    if request.method == 'POST':
        reserva.delete()
        return redirect('mis_reservas')
    return render(request, 'confirmar_eliminar.html', {'objeto': reserva, 'volver': 'mis_reservas'})


@login_required
def reservas(request):
    if request.user.rol != 'admin':
        raise PermissionDenied
    lista = Inscripcion.objects.all()
    return render(request, 'experiencias/reservas.html', {'reservas': lista})
