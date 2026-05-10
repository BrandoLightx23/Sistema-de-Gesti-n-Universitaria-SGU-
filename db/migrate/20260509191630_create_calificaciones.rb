class CreateCalificaciones < ActiveRecord::Migration[8.1]
  def change
    create_table :calificaciones do |t|
      t.references :estudiante, null: false, foreign_key: true
      t.references :materia, null: false, foreign_key: true
      t.references :docente, null: false, foreign_key: true
      t.decimal :valor_nota

      t.timestamps
    end
  end
end
