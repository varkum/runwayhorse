class PasswordResetsController < ApplicationController
  skip_before_action :validate_access
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user.present?
      token = user.generate_token_for(:password_reset)
      PasswordResetsMailer.with(user: user, token: token).reset.deliver_later
    end
    redirect_to signin_path, notice: "A reset link was sent to the email if it was found"
  end
  
  def edit
    @user = User.find_by_token_for(:password_reset, params[:token])
    redirect_to signin_path, alert: "Your reset link is invalid. Please try again" unless @user.present?
  end
  
  def update
    @user = User.find(params[:user])
    if @user.update password: params[:password], password_confirmation: params[:password_confirmation]
      redirect_to signin_path, notice: "Your password was successfully reset"
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
