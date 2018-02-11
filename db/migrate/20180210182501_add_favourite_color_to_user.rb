class AddFavouriteColorToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :favourite_color, :string
  end
end
