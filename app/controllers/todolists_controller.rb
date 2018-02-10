class TodolistsController < ApplicationController
  def new
    @todolist = Todolist.new
  end

  def create
    @todolist = Todolist.new(todolist_params)
    if @todolist.valid?
      @todolist.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @todolists = Todolist.all
  end

  def destroy
    Todolist.destroy(params[:id])
    redirect_back(fallback_location: root_path)
  end

  private

    def todolist_params
      params.require(:todolist).permit(:name, :author, :private)
    end
end