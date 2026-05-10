class Estudiante < ApplicationRecord
  belongs_to :usuario
  has_many :inscripciones, dependent: :destroy
  has_many :materias, through: :inscripciones
end
