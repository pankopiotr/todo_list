class TodolistsController < ApplicationController
  # include Pundit
  before_action :authenticate_user!, only: %i[new create destroy]
  # after_action :verify_authorized, only: :destroy
  # after_action :verify_policy_scoped, only: :index

  def new
    @todolist = Todolist.new
  end

  def create
    @todolist = current_user.todolists.build(todolist_params)
    if @todolist.valid?
      @todolist.save
      redirect_to todolists_path
    else
      render 'new'
    end
  end

  def index
    @todolists = policy_scope(Todolist)
  end

  def destroy
    @todolist = Todolist.find_by(id: params[:id])
    authorize @todolist
    @todolist.destroy
    redirect_back(fallback_location: authenticated_root_path)
  end

  private

    def todolist_params
      params.require(:todolist).permit(:name, :private)
    end
end