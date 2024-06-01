class PasswordResetsMailer < ApplicationMailer
  default from: 'hello@runwayhorse.com'
 
  def reset
    @user = params[:user]
    @token = params[:token]
    mail(to: @user.email.downcase, subject: "RunwayHorse Password Reset")
  end
end
