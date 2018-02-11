class TaskPolicy < TodolistPolicy
  def create?
    @record.todolist.user_id == @user.id
  end
end