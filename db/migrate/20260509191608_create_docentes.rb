class CreateDocentes < ActiveRecord::Migration[8.1]
  def change
    create_table :docentes do |t|
      t.references :usuario, null: false, foreign_key: true
      t.string :numero_empleado
      t.string :departamento

      t.timestamps
    end
    add_index :docentes, :numero_empleado, unique: true
  end
end
