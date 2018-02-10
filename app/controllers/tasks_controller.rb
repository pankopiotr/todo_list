class TasksController < ApplicationController
  before_action :find_todolist, only: %w[new create]

  def index
    @todolist = Todolist.find_by(id: params[:todolist_id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = @todolist.tasks.build(task_params)
    if @task.valid?
      @task.save
      redirect_to todolist_path(@task.todolist)
    else
      render 'new'
    end
  end

  private

    def task_params
      params.require(:task).permit(:title, :description)
    end

    def find_todolist
      @todolist = Todolist.find_by(id: params[:todolist_id])
    end
end