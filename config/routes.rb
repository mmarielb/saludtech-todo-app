Rails.application.routes.draw do
  root "tasks#index" #página principal muestra todas las tareas.
  resources :tasks do #genera todas las rutas CRUD
    member do
      patch :toggle_complete #añade una ruta para cambiar el estado de completada/no completada de una tarea
    end
  end
end

