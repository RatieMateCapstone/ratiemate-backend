class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.text :image
      t.text :trailer
      t.integer :rating
      t.text :description
      t.text :platform

      t.timestamps
    end
  end
end
