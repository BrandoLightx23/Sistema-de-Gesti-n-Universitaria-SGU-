class CreateMaterias < ActiveRecord::Migration[8.1]
  def change
    create_table :materias do |t|
      t.string :nombre_materia
      t.integer :creditos
      t.references :administrativo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
