class CreateInscripciones < ActiveRecord::Migration[8.1]
  def change
    create_table :inscripciones do |t|
      t.references :estudiante, null: false, foreign_key: true
      t.references :materia, null: false, foreign_key: true
      t.string :periodo

      t.timestamps
    end
  end
end
