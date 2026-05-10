class CreateUsuarios < ActiveRecord::Migration[8.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :correo
      t.string :password
      t.string :tipo_usuario

      t.timestamps
    end
    add_index :usuarios, :correo, unique: true
  end
end
