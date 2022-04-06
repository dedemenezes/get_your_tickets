class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.date :release_date
      t.string :poster_path
      t.string :backdrop_path

      t.timestamps
    end
  end
end
