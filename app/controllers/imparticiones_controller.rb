class ImparticionesController < ApplicationController
  before_action :verificar_docente

  # 1. Lista de materias disponibles para impartir
  def index
    @materias = Materia.all
    @mis_imparticiones = current_usuario.docente.imparticiones
  end

# 2. Acción de "Impartir" (Asignarse a una materia)
def create
    @imparticion = current_usuario.docente.imparticiones.build(
      materia_id: params[:materia_id],
      periodo: "Primavera 2026",
      nrc_grupo: "NRC-#{rand(1000..9999)}"
    )

    if @imparticion.save
      redirect_to imparticiones_path, notice: "Ahora impartes esta materia."
    else
      # Si falla la validación (ej. ya la imparte), mostramos una alerta roja
      redirect_to imparticiones_path, alert: "No se pudo asignar: Ya estás impartiendo esta materia."
    end
  end

  # 3. Ver alumnos de una materia específica
  def show
    @imparticion = current_usuario.docente.imparticiones.find(params[:id])
    @materia = @imparticion.materia

    # En lugar de traer solo los estudiantes, traemos las inscripciones completas
    @inscripciones = @materia.inscripciones
  end

  private

  def verificar_docente
    unless current_usuario&.tipo_usuario == "Docente"
      redirect_to root_path, alert: "Acceso exclusivo para docentes."
    end
  end
end
