class RemoveTypeFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :type, :string
  end
end
