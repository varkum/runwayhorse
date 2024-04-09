module Authentication
  extend ActiveSupport::Concern
  
  included do
    before_action :authenticate
    before_action :validate_access
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
end
