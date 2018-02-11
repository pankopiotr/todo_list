class Todolist < ApplicationRecord
  has_many :tasks
  belongs_to :user
  validates_presence_of :name
end