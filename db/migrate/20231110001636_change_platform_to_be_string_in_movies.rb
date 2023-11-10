class ChangePlatformToBeStringInMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :platform, :string
  end
end
