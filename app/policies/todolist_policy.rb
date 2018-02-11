class TodolistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Check whether @scope is relation(>1) or class
      if @scope.respond_to?(:count)
        @scope.where(private: false).or(@scope.where(user_id: @user.id))
      else
        @scope if @scope && @scope.user_id == @user.id || @scope.private == false
      end
    end
  end
  
  def destroy?
    @record.user_id == @user.id
  end
end