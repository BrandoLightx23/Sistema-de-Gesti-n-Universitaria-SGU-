class Materia < ApplicationRecord
  # ==========================================
  # 1. RELACIONES (Con quién se comunica)
  # ==========================================
  belongs_to :administrativo # Quien la creó

  has_many :imparticiones, dependent: :destroy
  has_many :inscripciones, dependent: :destroy

  # Esto permite llegar a los alumnos desde la materia
  has_many :estudiantes, through: :inscripciones

  # ==========================================
  # 2. VALIDACIONES (Seguridad de los datos)
  # ==========================================
  validates :nombre_materia, presence: true
  validates :creditos, presence: true, numericality: { only_integer: true }
end
