class ReviewsController < ApplicationController
  def index
    #homepage: timeline of most recent reviews with restaurants
    #links to specific restaurants for all reviews
    @reviews = Review.all_sorted
    @user = current_user
  end

  def new
    @restaurant = restaurant.name if restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    user = User.find(sessin[:user_id])
    if user
      review = Review.create(review_params)
      redirect_to user_path(user)
    else
      flash[:message] = "You must be logged in to make a review."
      redirect_to login_path
    end
  end



  def show
    @review = Review.find(params[:id])
  end

  private
    def review_params
      params.require(:review).permit(:rating, :content, :restaurant_id)
    end
end
