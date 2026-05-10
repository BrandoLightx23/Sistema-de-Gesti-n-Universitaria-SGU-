class ApplicationController < ActionController::Base
  # Esto permite que nuestras vistas (HTML) puedan usar este método
  helper_method :current_usuario

  def current_usuario
    # Si hay una sesión activa, busca al usuario en la base de datos
    if session[:usuario_id]
      @current_usuario ||= Usuario.find_by(id: session[:usuario_id])
    end
  end
end
