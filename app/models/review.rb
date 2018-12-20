class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :rating, presence: true
  validates :content, presence: true
  accepts_nested_attributes_for :restaurant

  def restaurant_attributes=(restaurant)
    self.restaurant = Restaurant.find_or_create_by(name: restaurant[:name])
    self.restaurant.update(restaurant)
  end

  def self.all_sorted
    Review.order(created_at: :desc)
  end

  def username
    self.user.username
  end
end
