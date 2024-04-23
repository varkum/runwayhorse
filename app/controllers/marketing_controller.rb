class MarketingController < ApplicationController
  layout "marketing"
  skip_before_action :authenticate, :validate_access

  def index
  end

  def pricing
  end
  
  def faq
  end
end
