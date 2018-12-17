class SessionController < ApplicationController

  def login
    user = User.find(params[:id])
    if user
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

end
