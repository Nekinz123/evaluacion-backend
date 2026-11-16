from django.contrib.auth.models import AbstractUser
from django.db import models

ROLES = [
    ('admin', 'Administrador'),
    ('guia', 'Guía / Operador'),
    ('turista', 'Turista / Cliente'),
]


class Usuario(AbstractUser):
    rol = models.CharField(max_length=10, choices=ROLES, default='turista')
