class InicioController < ApplicationController
  def index
    # La variable empieza con '@' para que la Vista pueda leerla
    @usuarios = Usuario.all
  end
end
