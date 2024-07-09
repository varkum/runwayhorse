module Sharing
  extend ActiveSupport::Concern
  
  class_methods do 
    def allow_unauthenticated_access(**options)
      skip_before_action :validate_access, if: -> { validate_shared_trip_token }, **options
    end
  end
  
  def validate_shared_trip_token
    @trip_token = params[:token] || params[:trip_token]
    @trip = Trip.find_by_token_for(:sharing, @trip_token)
  end
end
