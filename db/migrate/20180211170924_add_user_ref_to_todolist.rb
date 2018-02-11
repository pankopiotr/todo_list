class AddUserRefToTodolist < ActiveRecord::Migration[5.1]
  def change
    add_reference :todolists, :user, foreign_key: true
    remove_column :todolists, :author
  end
end
