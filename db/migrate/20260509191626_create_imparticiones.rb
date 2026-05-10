class CreateImparticiones < ActiveRecord::Migration[8.1]
  def change
    create_table :imparticiones do |t|
      t.references :docente, null: false, foreign_key: true
      t.references :materia, null: false, foreign_key: true
      t.string :periodo
      t.string :nrc_grupo

      t.timestamps
    end
  end
end
