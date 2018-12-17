class UsersController < ApplicationController
  def new
    #form to sign up
    @user = User.new
  end

  def create
    #create a new user
  end

  def destroy

  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end
