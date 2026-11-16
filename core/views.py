from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect


def inicio(request):
    if request.user.is_authenticated:
        return redirect('panel')
    return render(request, 'core/inicio.html')


@login_required
def panel(request):
    return render(request, 'core/panel.html')
