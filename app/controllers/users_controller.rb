class UsersController < ApplicationController
  skip_before_action :validate_access

  def new
    if Current.user.present?
      redirect_to root_path
    end

    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      TransactionsMailer.with(user: @user).welcome.deliver_later
      redirect_to new_trip_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
