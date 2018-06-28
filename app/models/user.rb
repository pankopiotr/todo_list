class User < ApplicationRecord
  has_many :todolists
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :nickname, presence: true

  def to_s
    nickname
  end
end
