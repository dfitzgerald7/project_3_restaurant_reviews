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
    @restaurant = params[:restaurant_id] ? Restaurant.find(params[:restaurant_id]) : Restaurant.new
    @review = @restaurant.reviews.build
  end

  def create
    if current_user == User.find(session[:user_id])
      review = Review.create(review_params)
      review.user = current_user
      review.save
    #  binding.pry
      if review.invalid?
        if params[:review][:restaurant_id] != ""
          return redirect_to new_restaurant_review_path(Restaurant.find(params[:review][:restaurant_id]))
        else
          return redirect_to new_review_path
        end
      end
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
