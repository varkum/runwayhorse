class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]
  
  def new
  end
  
  def create
    if user = User.authenticate_by(email: params[:email], password: params[:password])
      session[:user_id] = user.id
      redirect_to trips_path
    else
      redirect_to signin_path, alert: "That email or password is incorrect. Please try again"
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to signin_path
  end
end
