class DeleteStaleTasksJob
  def perform
    Task.where('deadline < ?', 30.days.ago).destroy_all
  end
end
