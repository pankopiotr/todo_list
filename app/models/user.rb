class User < ApplicationRecord
  #yay visible secret, so secure
  ENCRYPTION_KEY = "\x8D\xD2\xF9-)?\xC5`\x9F\xBA\xE5 \xC4\x06k\x90\x93&\xBA\x92\"\xAB\xCD\xA6\x88C\xCC\v!\xE9x\xD3"
  has_many :todolists

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :nickname, presence: true

  attr_encrypted :nickname, key: ENCRYPTION_KEY

  def to_s
    nickname
  end
end
