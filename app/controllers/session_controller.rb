class SessionController < ApplicationController

  def new

  end

  def create
    binding.pry
    user = User.find_by(username: session_params[:username])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Invalid user. Please try again."
      redirect_to login_path
    end
  end

  def github
    @user = User.find_or_initialize_by(id: auth['uid']).tap do |u|
      flash[:message] = "Login successful."
      u.username = auth['info']['nickname']
      u.password = "password"
      u.save
      session[:user_id] = u.id
    end
    redirect_to :root
  end

  def logout
    session.clear
    redirect_to :root
  end

  private
    def session_params
      params.require(:session).permit(:username, :password)
    end

    def auth
     request.env['omniauth.auth']
   end
end
