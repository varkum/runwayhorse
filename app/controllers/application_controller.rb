class ApplicationController < ActionController::Base
  include Authentication, Sharing
  
  private
  
  def redirect_if_trial_expired
    trip = @trip || @day.trip
    
    if trip.expired_trial?
      redirect_to trip_path(trip)
    end
  end
end
