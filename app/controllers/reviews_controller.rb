class ReviewsController < ApplicationController
  def index
    #homepage: timeline of most recent reviews with restaurants
    #links to specific restaurants for all reviews
    @reviews = Review.all_sorted
    @user = current_user
  end

  def new
    if restaurant = Restaurant.find(params[:restaurant_id])
      @restaurant = restaurant.name
    end
    @review = Review.new(restaurant_id: params[:restaurant_id])
  end

  def create
    user = User.find(session[:user_id])
    if user
      review = Review.create(review_params)
      review.user = user
      review.save
      binding.pry
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
