class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  validates :name, presence: true, uniqueness: true
  
  def self.top_rated
    Restaurant.joins(:reviews).group(:restaurant_id).order("avg(rating) desc")
  end

  def rating
    sum = 0
    num = self.reviews.length
    self.reviews.each{|review| sum += review.rating}
    sum/num if self.reviews
  end
end
