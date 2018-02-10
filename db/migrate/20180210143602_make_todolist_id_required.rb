class MakeTodolistIdRequired < ActiveRecord::Migration[5.1]
  def change
    change_column_null :tasks, :todolist_id, false
  end
end
