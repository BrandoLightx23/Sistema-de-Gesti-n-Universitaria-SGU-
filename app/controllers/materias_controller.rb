class MateriasController < ApplicationController
  # Los filtros se ejecutan de arriba hacia abajo
  before_action :verificar_admin
  before_action :set_materia, only: %i[ show edit update destroy ]

  # ==========================================
  # MÉTODOS PÚBLICOS (ACCIONES)
  # ==========================================

  def index
    @materias = Materia.all
  end

  def show
  end

  def new
    @materia = current_usuario.administrativo.materias.build
  end

  def edit
  end

  def create
    @materia = current_usuario.administrativo.materias.build(materia_params)

    if @materia.save
      redirect_to @materia, notice: "La materia fue creada exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @materia.update(materia_params)
      redirect_to @materia, notice: "La materia fue actualizada."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @materia.destroy!
    redirect_to materias_path, notice: "Materia eliminada correctamente.", status: :see_other
  end

  # ==========================================
  # MÉTODOS PRIVADOS (HERRAMIENTAS INTERNAS)
  # ==========================================
  private

  def verificar_admin
    unless current_usuario&.tipo_usuario == "Administrativo"
      redirect_to root_path, alert: "No tienes permiso para gestionar materias."
    end
  end

  def set_materia
    @materia = Materia.find(params[:id])
  end

  # Autorizamos explícitamente los datos que el formulario nos puede enviar
  def materia_params
    params.require(:materia).permit(:nombre_materia, :creditos)
  end
end
