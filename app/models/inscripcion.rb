class Inscripcion < ApplicationRecord
  belongs_to :estudiante
  belongs_to :materia

  # Evita que un estudiante se inscriba dos veces en la misma materia
  validates :materia_id, uniqueness: {
    scope: :estudiante_id,
    message: "Ya estás inscrito en esta materia."
  }
end
