# Sistema de Gestión Universitaria (SGU) 🎓

Este es un sistema integral de gestión académica desarrollado en **Ruby on Rails**, diseñado para facilitar la interacción entre los diferentes actores de la comunidad universitaria: Administrativos, Docentes y Estudiantes.

El proyecto implementa una arquitectura robusta para el manejo de catálogos de materias, asignación de imparticiones y procesos de inscripción con seguimiento de calificaciones.

## 🚀 Características Principales

El sistema se divide en tres módulos principales según el rol del usuario:

* **Panel Administrativo:**
* Gestión total del catálogo de materias (Crear, Editar, Eliminar).
* Administración de cuentas de usuario y control de acceso.
* Supervisión de la integridad de datos académicos.


* **Panel Docente:**
* Selección de materias para impartir desde el catálogo general.
* Gestión de listas de alumnos por asignatura y grupo (NRC).
* Asignación y actualización de calificaciones en tiempo real.


* **Portal del Estudiante:**
* Inscripción autogestiva a materias disponibles.
* Consulta de carga académica y visualización de calificaciones.
* Gestión de bajas de asignaturas.



## 🛠️ Stack Tecnológico

* **Framework:** Ruby on Rails (Optimizado para entornos Linux Mint/Unix).
* **Lenguaje:** Ruby.
* **Base de Datos:** MySQL.
* **Frontend:** HTML5, CSS3 (Flexbox/Grid) y Turbo/Hotwire para interactividad sin recarga de página.
* **Seguridad:** Encriptación de contraseñas mediante BCrypt.

## 📋 Requisitos e Instalación

Para ejecutar este proyecto en tu entorno local (especialmente si usas sistemas basados en Debian/Ubuntu como Linux Mint), sigue estos pasos:

1. **Clonar el repositorio:**
```bash
git clone https://github.com/BrandoLightx23/Sistema-de-Gesti-n-Universitaria-SGU-.git
cd Sistema-de-Gesti-n-Universitaria-SGU-

```


2. **Instalar dependencias:**
```bash
bundle install

```


3. **Configurar la base de datos:**
Asegúrate de tener MySQL corriendo y actualiza tus credenciales en `config/database.yml`. Luego ejecuta:
```bash
rails db:create
rails db:migrate

```



## 💻 Cómo iniciar el servidor

Para poner en marcha el sistema, simplemente ejecuta el siguiente comando en tu terminal:

```bash
rails server

```

Una vez iniciado, abre tu navegador y dirígete a: `http://localhost:3000`

---

## ✒️ Autor

Este proyecto fue desarrollado por **Brando Rojas Tellez**, estudiante de Ingeniería en Sistemas Computacionales en la **Facultad de Ciencias de la Computación (BUAP)**, ciclo 2022-2026.

---
