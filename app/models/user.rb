class User < ApplicationRecord
  has_many :reviews
  has_many :restaurants, through: :reviews
  has_secure_password
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true
end
