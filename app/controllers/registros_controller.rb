class RegistrosController < ApplicationController
  def new
    @usuario = Usuario.new
  end

def create
    @usuario = Usuario.new(usuario_params)

    # 1. Antes de guardar, construimos el perfil asociado en memoria usando los inputs extra
    case @usuario.tipo_usuario
    when "Estudiante"
      @usuario.build_estudiante(matricula: params[:matricula], semestre_actual: params[:semestre_actual])
    when "Docente"
      @usuario.build_docente(numero_empleado: params[:numero_empleado], departamento: params[:departamento])
    when "Administrativo"
      @usuario.build_administrativo(cargo: params[:cargo])
    end

    # 2. El .save ahora guardará el Usuario Y TAMBIÉN su perfil asociado (Estudiante/Docente/Admin)
    if @usuario.save
      session[:usuario_id] = @usuario.id
      redirect_to root_path, notice: "¡Cuenta de #{@usuario.tipo_usuario} creada exitosamente!"
    else
      render :new, status: :unprocessable_entity
    end
end

  private

  # Medida de seguridad: Solo permitimos que nos envíen estos datos específicos
  def usuario_params
    params.require(:usuario).permit(:nombre, :correo, :password, :password_confirmation, :tipo_usuario)
  end
end
