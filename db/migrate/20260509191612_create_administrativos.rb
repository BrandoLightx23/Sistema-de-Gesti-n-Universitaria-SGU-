class CreateAdministrativos < ActiveRecord::Migration[8.1]
  def change
    create_table :administrativos do |t|
      t.references :usuario, null: false, foreign_key: true
      t.string :cargo

      t.timestamps
    end
  end
end
