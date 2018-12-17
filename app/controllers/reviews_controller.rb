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
    if restaurant = Restaurant.find(params[:restaurant_id])
      @reviews = restaurant.reviews
    else
      @reviews = Review.all
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private
    def review_params
      params.require(:review).permit(:restaurant_id)
    end
end
