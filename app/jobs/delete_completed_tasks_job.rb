class DeleteCompletedTasksJob
  def perform
    Task.where(completed: true).destroy_all
  end
end
