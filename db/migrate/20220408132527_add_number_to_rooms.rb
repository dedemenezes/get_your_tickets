class AddNumberToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :number, :integer
  end
end
