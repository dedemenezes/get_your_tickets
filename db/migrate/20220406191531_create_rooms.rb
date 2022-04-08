class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :capacity
      t.string :type
      t.references :teather, null: false, foreign_key: true

      t.timestamps
    end
  end
end
