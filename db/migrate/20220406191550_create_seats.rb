class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.string :type
      t.boolean :available
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
