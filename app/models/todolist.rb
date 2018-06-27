class Todolist < ApplicationRecord
  has_many :tasks
  belongs_to :user
  validates_presence_of :name
  validates :private, :inclusion => {:in => [true, false]}

  scope :unrestricted, ->{ where(private: false) }

  def count_tasks
    tasks.count
  end
end
