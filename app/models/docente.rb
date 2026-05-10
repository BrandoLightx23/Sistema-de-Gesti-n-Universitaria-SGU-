class Docente < ApplicationRecord
  belongs_to :usuario
  has_many :imparticiones, dependent: :destroy
  has_many :materias, through: :imparticiones
end
