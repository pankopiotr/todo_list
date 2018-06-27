class AddDeadlineToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :deadline, :date
  end
end
