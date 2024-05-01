class TransactionsMailer < ApplicationMailer
  default from: 'hello@runwayhorse.com'
  
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to RunwayHorse")
  end
  
  def trial_almost_done
    @user = params[:user]
    @trip = params[:trip]
    
    mail(to: @user.email, subject: "Your RunwayHorse Trial Expires Soon")
  end
  
  def trial_done
    @user = params[:user]
    @trip = params[:trip]
    
    mail(to: @user.email, subject: "Your RunwayHorse Trial has Expired")
  end
end
