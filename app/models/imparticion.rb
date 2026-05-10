class Imparticion < ApplicationRecord
  belongs_to :docente
  belongs_to :materia

  # Evita que un docente imparta la misma materia dos veces
  validates :materia_id, uniqueness: {
    scope: :docente_id,
    message: "Ya está siendo impartida por ti en este periodo."
  }
end
