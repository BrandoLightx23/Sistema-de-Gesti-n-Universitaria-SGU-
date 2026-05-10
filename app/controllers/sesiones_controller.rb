class SesionesController < ApplicationController
  def new
    # Solo muestra el formulario vacío
  end

  def create
    # 1. Buscamos al usuario por su correo
    usuario = Usuario.find_by(correo: params[:correo])

    # 2. Verificamos que exista y que la contraseña coincida
    if usuario && usuario.authenticate(params[:password])
      # ¡Éxito! Guardamos el ID en la sesión
      session[:usuario_id] = usuario.id
      redirect_to root_path, notice: "¡Bienvenido de vuelta!"
    else
      # Error: correo o contraseña mal
      flash.now[:alert] = "Correo o contraseña incorrectos"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # Para cerrar sesión, simplemente borramos el ID de la memoria
    session[:usuario_id] = nil
    redirect_to root_path, notice: "Has cerrado sesión correctamente."
  end
end
