class TransactionsMailer < ApplicationMailer
  default from: 'hello@runwayhorse.com'
  
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to RunwayHorse")
  end
  
  def trial_almost_done
    @user = params[:user]
    mail(to: @user.email, subject: "Your RunwayHorse Trial is Almost Over")
  end
  
  def receipt
    @user = params[:user]
    mail(to: @user.email, subject: "Your RunwayHorse Trip Receipt")
  end
end
