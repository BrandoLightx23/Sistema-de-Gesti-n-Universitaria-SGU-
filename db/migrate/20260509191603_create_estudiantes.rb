class CreateEstudiantes < ActiveRecord::Migration[8.1]
  def change
    create_table :estudiantes do |t|
      t.references :usuario, null: false, foreign_key: true
      t.string :matricula
      t.integer :semestre_actual

      t.timestamps
    end
    add_index :estudiantes, :matricula, unique: true
  end
end
