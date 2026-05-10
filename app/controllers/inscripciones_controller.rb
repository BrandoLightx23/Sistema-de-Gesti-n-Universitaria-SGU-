class InscripcionesController < ApplicationController
before_action :verificar_estudiante, except: [ :update ]

  # 1. Pantalla principal del estudiante
  def index
    @materias = Materia.all
    @mis_inscripciones = current_usuario.estudiante.inscripciones
  end

  # 2. Inscribirse a una materia
  def create
    @inscripcion = current_usuario.estudiante.inscripciones.build(
      materia_id: params[:materia_id],
      calificacion: nil # Inicia sin calificación
    )

    if @inscripcion.save
      redirect_to inscripciones_path, notice: "¡Te has inscrito correctamente!"
    else
      redirect_to inscripciones_path, alert: "No se pudo inscribir: Ya estás en esta clase."
    end
  end

  # 3. Dar de baja una materia
  def destroy
    @inscripcion = current_usuario.estudiante.inscripciones.find(params[:id])
    @inscripcion.destroy
    redirect_to inscripciones_path, notice: "Has dado de baja la materia."
  end
  # 4. Docente califica al alumno (Update)
  def update
    @inscripcion = Inscripcion.find(params[:id])

    # Seguridad: Verificamos que quien está guardando sea un Docente
    if current_usuario.tipo_usuario == "Docente"
      # Actualizamos solo el cajón de calificación
      parametros_seguros = params.require(:inscripcion).permit(:calificacion)

    if @inscripcion.update(parametros_seguros)
      redirect_back fallback_location: root_path, notice: "Calificación asignada correctamente."
    else
      redirect_back fallback_location: root_path, alert: "Hubo un error al guardar la nota."
    end
    else
      redirect_to root_path, alert: "No tienes permiso para calificar."
    end
  end
  private

  def verificar_estudiante
    unless current_usuario&.tipo_usuario == "Estudiante"
      redirect_to root_path, alert: "Acceso exclusivo para estudiantes."
    end
  end
end
