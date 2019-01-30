class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :avg_rating
  has_many :reviews, serializer: RestaurantReviewSerializer

end
