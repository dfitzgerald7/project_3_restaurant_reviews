class ReviewsController < ApplicationController
  def index
    #homepage: timeline of most recent reviews with restaurants
    #links to specific restaurants for all reviews
    if params[:user_id]
      @user = User.find(params[:user_id])
      @reviews = @user.reviews
    else
      @reviews = Review.all_sorted
      @user = current_user
    end
  end

  def new
    if current_user.id == session[:user_id].to_i
      @restaurant = params[:restaurant_id] ? Restaurant.find(params[:restaurant_id]) : Restaurant.new
      @review = @restaurant.reviews.build
    else
      flash[:message] = "You must be logged in to make a review."
      redirect_to login_path
    end
  end

  def create
    if current_user.id == session[:user_id].to_i
      @review = Review.create(review_params)
      @review.user = current_user
      @review.save
    #  binding.pry
      if @review.invalid?
        render :new
      else
        redirect_to user_path(current_user)
      end
    else
      flash[:message] = "You must be logged in to make a review."
      redirect_to login_path
    end
  end

  private
    def review_params
      params.require(:review).permit(:rating, :content, restaurant_attributes: [:name])
    end
end
