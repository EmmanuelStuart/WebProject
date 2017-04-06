class User < ApplicationRecord
  belongs_to :province

  validates :username, :password, presence: true
  validates :username, :password, length: { minimum: 7 }
  validates :username, uniqueness: true

end
