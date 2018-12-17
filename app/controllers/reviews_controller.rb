class ReviewsController < ApplicationController
  def new
    @restaurant = restaurant if restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    review = Review.create(review_params)
    redirect_to review_path(review)
  end

  def index
    #homepage: timeline of most recent reviews with restaurants 
    @reviews = Review.all_sorted
    @user = current_user
  end

  def show
    @review = Review.find(params[:id])
  end

  private
    def review_params
      params.require(:review).permit(:rating, :content, :restaurant_id)
    end
end
