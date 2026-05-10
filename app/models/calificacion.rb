class Calificacion < ApplicationRecord
  belongs_to :estudiante
  belongs_to :materia
  belongs_to :docente
end
