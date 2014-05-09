class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :rated
      t.date :released
      t.integer :runtime
      t.string :genre
      t.string :director
      t.string :writer
      t.string :actors
      t.text :plot
      t.string :movie_poster

      t.timestamps
    end
  end
end
