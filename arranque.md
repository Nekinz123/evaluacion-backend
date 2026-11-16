1. Crear un venv con "python -m venv venv" o "python3 -m venv venv"
2. Activarlo con:
    Windows - "venv\Scripts\activate"
    Linux   - "source venv/bin/activate"
3. Ejecutar "pip install -r requirements.txt" para instalar las dependencias
4. Cambiar las credenciales en 'settings.py' para la conexion a la base de datos a credenciales válidas(usuario, contraseña, nombre de base de datos)
5. Aplicar las migraciones con "python manage.py migrate"
6. Importar la data desde el archivo 'usuarios_data.sql'. IMPORTANTE elegir 'eva3' como esquema por defecto y seleccionar en las opciones como "Dump Data Only"
7. Correr el servidor con "python manage.py runserver"

EL ARCHIVO 'arquitectura_bd.sql' es el respaldo de la base de datos y contiene la estructura completa con los datos, si se encuentran errores de compatibilidad en el paso 6(quizas errores de versiones del mysql workbench) este podría servir 