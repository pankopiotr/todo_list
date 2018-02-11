class TasksController < ApplicationController
  # include Pundit
  before_action :authenticate_user!, only: %i[new create]
  before_action :find_todolist
  # after_action :verify_authorized, only: :create
  # after_action :verify_policy_scoped

  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = @todolist.tasks.build(task_params)
    authorize @task
    if @task.save
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
      @todolist = policy_scope(Todolist.find_by(id: params[:todolist_id]))
      raise Pundit::NotAuthorizedErrorm "no todolist found" unless @todolist
    end
end