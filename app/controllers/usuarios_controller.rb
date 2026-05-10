class UsuariosController < ApplicationController
  # 1. Protegemos el controlador entero
  before_action :verificar_admin

  # 2. Listar todos los usuarios
  def index
    @usuarios = Usuario.all.order(created_at: :desc)
  end

  # 3. Eliminar un usuario
  def destroy
    @usuario_a_borrar = Usuario.find(params[:id])

    # Evitar que el administrador se borre a sí mismo por accidente
    if @usuario_a_borrar == current_usuario
      redirect_to usuarios_path, alert: "No puedes eliminar tu propia cuenta administrativa."
    else
      @usuario_a_borrar.destroy
      redirect_to usuarios_path, notice: "Usuario eliminado correctamente."
    end
  end

  private

  # 4. El candado de seguridad
  def verificar_admin
    unless current_usuario&.tipo_usuario == "Administrativo"
      redirect_to root_path, alert: "Acceso restringido a administradores."
    end
  end
end
