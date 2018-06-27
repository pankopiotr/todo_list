class Todolist < ApplicationRecord
  has_many :tasks
  belongs_to :user
  validates_presence_of :name

  scope :unrestricted, ->{ where(private: false) }

  def count_tasks
    tasks.count
  end
end
