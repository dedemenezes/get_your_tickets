class CreateExibithions < ActiveRecord::Migration[6.1]
  def change
    create_table :exibithions do |t|
      t.datetime :start_time
      t.references :room, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
