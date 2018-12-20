class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.top_rated
    
    #shows top rated restaurants
    #if logged in, you can see everything else but add restaurants, reviews, and upvote
    #if logged in, can sort by categories
  end

  def show
    #shows all reviews for that individual restaurant
    # if logged in, can vote on reviews
  end

  def create
    #only available if logged in
  end

  def edit
    #admins can change name
  end

  def update
    #same as edit
  end

  def destroy
    #admins can delete restaurant if it goes out of business
  end

  private
    def find_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name)
    end
end
