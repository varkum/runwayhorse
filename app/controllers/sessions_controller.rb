class SessionsController < ApplicationController
  skip_before_action :validate_access, only: [ :new, :create ]

  def new
    if Current.user.present?
      redirect_to root_path
    end
  end

  def create
    if user = User.authenticate_by(email: params[:email].strip.downcase, password: params[:password])
      session[:user_id] = user.id
      redirect_to trips_path
    else
      redirect_to signin_path, alert: "That email or password is incorrect. Please try again"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to signin_path, notice: "You've been signed out"
  end
end
