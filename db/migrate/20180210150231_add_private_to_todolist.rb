class AddPrivateToTodolist < ActiveRecord::Migration[5.1]
  def change
    add_column :todolists, :private, :boolean, default: false
  end
end
