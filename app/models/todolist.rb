class Todolist < ApplicationRecord
  has_many :tasks
  belongs_to :user
  validates_presence_of :name
  before_create :remove_nulls

  scope :unrestricted, ->{ where(private: false) }

  def count_tasks
    tasks.count
  end

  private

    def remove_nulls
      self.private ||= false
    end
end