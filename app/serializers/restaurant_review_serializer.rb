class RestaurantReviewSerializer < ActiveModel::Serializer
  attributes :rating#, :avg_rating


  # => COME BACK TO THIS
  # def avg_rating
  #     sum = 0
  #     length = object.reviews.length
  #     object.reviews.each do |review|
  #       sum += review.rating
  #     end
  #     sum/length
  # end
end
