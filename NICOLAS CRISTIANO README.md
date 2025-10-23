# Nicolás Cristiano Resumen

## Resumen de los vídeos NC

Los videos explican de forma sencilla qué es Docker y cómo ayuda a ejecutar aplicaciones sin complicaciones. En lugar de instalar cada parte del proyecto manualmente, Docker guarda la aplicación junto con todo lo necesario para que funcione dentro de un contenedor, que puede usarse en cualquier computadora sin problemas.  

Se aclara la diferencia con las máquinas virtuales, que son más pesadas porque necesitan un sistema operativo completo. Con Docker todo es más rápido y ligero.  
También enseña cómo instalar Docker, crear contenedores, descargar imágenes y conectarlas entre sí, además de cómo crear tus propias imágenes con un Dockerfile.  
Otra parte importante es Docker Compose, que permite ejecutar varios contenedores al mismo tiempo, algo ideal para proyectos que combinan una aplicación con su base de datos.  
Finalmente, se explica cómo usar volúmenes para guardar los datos y cómo preparar entornos para desarrollo y producción.

---

## Reflexión personal

Aprender Docker cambia mucho la forma de trabajar en desarrollo. Antes todo era un problema de configuraciones y compatibilidad, pero ahora todo se vuelve más rápido y organizado.  
Lo más útil es que puedes tener la seguridad de que tu proyecto funcionará igual en cualquier computador o servidor.  

Al principio puede parecer confuso, pero una vez se entiende, ahorra mucho tiempo y esfuerzo. Me parece una herramienta muy práctica para trabajar en equipo, porque evita errores y mantiene todo bajo control. En pocas palabras, hace que el desarrollo sea más profesional y ordenado.

---

## Ejemplo práctico

Ejemplo básico:  
Supongamos que quieres ejecutar una aplicación muy simple en Docker, por ejemplo un pequeño programa en Python que muestre “Hola desde Docker”.

1. Crea una carpeta llamada `hola-docker` y dentro de ella un archivo `app.py` con este contenido:  
   ```python
   print("Hola desde Docker")
   ```

2. En la misma carpeta, crea un archivo llamado `Dockerfile`:  
   ```dockerfile
   FROM python:3.9-slim
   WORKDIR /app
   COPY app.py .
   CMD ["python", "app.py"]
   ```

3. Abre una terminal en esa carpeta y ejecuta los siguientes comandos:  
   ```bash
   docker build -t hola-docker .
   docker run hola-docker
   ```

Resultado:  
Docker descargará la imagen de Python, creará un contenedor y mostrará en la terminal:  
```
Hola desde Docker
```

De esta forma se demuestra cómo Docker puede ejecutar una aplicación sin necesidad de instalar Python localmente, encapsulando todo dentro del contenedor.

---

## Recursos usados

- [Documentación oficial de Docker](https://docs.docker.com/)  
- [Guía “Get Started with Docker”](https://docs.docker.com/get-started/)  
- [Play with Docker (laboratorio en línea gratuito)](https://labs.play-with-docker.com/)  
- [Docker Hub (repositorio de imágenes)](https://hub.docker.com/)  
