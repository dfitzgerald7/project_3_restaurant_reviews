class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :content, :restaurant
  belongs_to :user#, serializer: UserReviewSerializer
end
