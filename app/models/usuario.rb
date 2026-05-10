class Usuario < ApplicationRecord
  has_secure_password

  has_one :estudiante, dependent: :destroy
  has_one :docente, dependent: :destroy
  has_one :administrativo, dependent: :destroy
end
