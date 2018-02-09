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

  private

    def todolist_params
      params.require(:todolist).permit(:name, :author)
    end
end