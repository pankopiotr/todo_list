class Task < ApplicationRecord
  belongs_to :todolist
  validates_presence_of :title
  validates :completed, :inclusion => {:in => [true, false]}
end
