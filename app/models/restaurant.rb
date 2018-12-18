class Restaurant < ApplicationRecord
  has_many :categories
  has_many :reviews
  has_many :users, through: :reviews

  def self.top_rated
    Restaurant.joins(:reviews).group(:restaurant_id).order("avg(rating) desc")
  end

end
