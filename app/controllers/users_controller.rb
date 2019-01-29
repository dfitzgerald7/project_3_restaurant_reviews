class UsersController < ApplicationController
  def new
    #form to sign up
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Invalid entry, please try again."
      redirect_to new_user_path
    end
  end

  def show
    if session[:user_id] = params[:id]
      @user = User.find(params[:id])
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @user }
      end
    else
      flash[:message] = "You cannot see another user's information."
      redirect_to :root
    end
  end


  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end
