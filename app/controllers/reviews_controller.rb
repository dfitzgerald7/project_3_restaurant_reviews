class ReviewsController < ApplicationController
  def index
    #homepage: timeline of most recent reviews with restaurants
    #links to specific restaurants for all reviews
    @reviews = Review.all_sorted
    @user = current_user
  end

  def new
    @restaurant = params[:restaurant_id] ? Restaurant.find(params[:restaurant_id]) : Restaurant.new
    @review = @restaurant.reviews.build
  end

  def create
    if current_user == User.find(session[:user_id])
      review = Review.create(review_params)
      review.user = current_user
      review.save
      binding.pry
      redirect_to user_path(current_user)
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
      params.require(:review).permit(:rating, :content, restaurant_attributes: [:name])
    end
end
