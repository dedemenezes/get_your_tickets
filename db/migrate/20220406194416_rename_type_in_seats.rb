class RenameTypeInSeats < ActiveRecord::Migration[6.1]
  def change
    rename_column :seats, :type, :seat_type
  end
end
