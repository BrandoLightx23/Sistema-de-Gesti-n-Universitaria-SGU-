Rails.application.routes.draw do
  get "usuarios/index"
  get "usuarios/destroy"
  # Recursos: CRUD (Create, Read, Update, Destroy)
  resources :materias
  resources :imparticiones, only: [ :index, :create, :show ]
  # Solo agrega :update al final de la lista
  resources :inscripciones, only: [ :index, :create, :destroy, :update ]
# Agregamos gestión de usuarios para el administrador
resources :usuarios, only: [ :index, :destroy ]

  # Página principal
  root "inicio#index"

  # Rutas para el registro
  get "registro", to: "registros#new"
  post "registro", to: "registros#create"

  # Rutas de Sesión (Login / Logout)
  get "login", to: "sesiones#new"
  post "login", to: "sesiones#create"
  delete "logout", to: "sesiones#destroy"
end
