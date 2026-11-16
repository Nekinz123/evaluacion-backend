from django.conf import settings
from django.db import models
from cuentas.models import Usuario

ESTADOS_PAGO = [
    ('pendiente', 'Pendiente'),
    ('confirmado', 'Confirmado'),
]


class Categoria(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    activo = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre


class Experiencia(models.Model):
    titulo = models.CharField(max_length=150)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    cupo_maximo = models.PositiveIntegerField()
    fecha_hora = models.DateTimeField()
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    creador = models.ForeignKey(Usuario, on_delete=models.CASCADE)

    def __str__(self):
        return self.titulo


class Inscripcion(models.Model):
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    experiencia = models.ForeignKey(Experiencia, on_delete=models.CASCADE)
    fecha_inscripcion = models.DateTimeField(auto_now_add=True)
    estado_pago = models.CharField(max_length=12, choices=ESTADOS_PAGO, default='pendiente')

    def __str__(self):
        return f'{self.usuario} - {self.experiencia}'
