class AddCompletedToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :completed, :boolean, default: false, null: false
  end
end
