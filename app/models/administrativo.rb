class Administrativo < ApplicationRecord
  belongs_to :usuario
  has_many :materias, dependent: :destroy # Un admin gestiona muchas materias
end
