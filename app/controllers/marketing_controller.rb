class MarketingController < ApplicationController
  skip_before_action :authenticate, :validate_access
  
  def index
  end
end
