module Sharing
  extend ActiveSupport::Concern
  
  class_methods do 
    def allow_unauthenticated_access(**options)
      skip_before_action :validate_access, if: :valid_trip_share?, **options
    end
  end
  
  private
  
  def valid_trip_share?
    @trip_token = params[:id] || params[:trip_id]
    @trip = Trip.find_by_token_for(:sharing, @trip_token)
    @trip.present?
  end
end
