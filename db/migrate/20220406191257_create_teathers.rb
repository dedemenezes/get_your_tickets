class CreateTeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :teathers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
