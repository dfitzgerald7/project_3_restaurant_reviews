class UsersController < ApplicationController
  def new
    #form to sign up
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user
      redirect_to user_path(user)
    else
      flash[:message] = "Invalid entry, please try again."
      redirect_to new_user_path
    end
  end

  def destroy

  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end
