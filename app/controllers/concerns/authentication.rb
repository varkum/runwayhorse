module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
    before_action :validate_access
    helper_method :signed_in?
  end

  private
  def authenticate
    if authenticated_user = User.find_by(id: session[:user_id])
      Current.user = authenticated_user
    end
  end

  def validate_access
    unless Current.user.present?
      redirect_to signin_path
    end
  end
  
  def signed_in?
    Current.user.present?
  end
end
