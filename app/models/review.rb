class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def self.all_sorted
    Review.order(created_at: :desc)
  end

  def username
    self.user.username 
  end
end
