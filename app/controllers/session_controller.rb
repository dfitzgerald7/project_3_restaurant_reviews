class SessionController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: session_params[:username])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = params[:id]
      redirect_to user_path(user)
    else
      flash[:message] = "Invalid user. Please try again."
      redirect_to new_user
    end
  end

  def logout
    session.clear
    redirect_to :root
  end

  private
    def session_params
      params.require(:session).permit(:username, :password)
    end
end
