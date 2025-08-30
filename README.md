# SaludTech Todo App

## Descripción

Aplicación de lista de tareas (To-Do) desarrollada como prueba técnica para SaludTech. Permite a los usuarios gestionar sus tareas de manera eficiente.

## Requisitos

- Ruby 3.2.2
- Rails 7.1.5.2
- PostgreSQL
- Node.js y Yarn para la gestión de dependencias frontend

## Instalación

1. Clona el repositorio:

   ```bash
   git clone https://github.com/mmarielb/saludtech-todo-app.git
   cd saludtech-todo-app

2. Instala las dependencias:
    bundle install
    yarn install

3. Configura la base de datos:
    bin/rails db:create
    bin/rails db:migrate
    bin/rails db:seed

4. Inicia el servidor:
    bin/rails server

La aplicación estará disponible en http://localhost:3000.

Accede a la aplicación a través de tu navegador.

Puedes crear, editar y eliminar tareas.

Las tareas se almacenan en una base de datos PostgreSQL.