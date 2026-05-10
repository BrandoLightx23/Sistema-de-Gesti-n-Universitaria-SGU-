class AgregarCalificacionAInscripciones < ActiveRecord::Migration[7.1]
  def change
    add_column :inscripciones, :calificacion, :float
  end
end
