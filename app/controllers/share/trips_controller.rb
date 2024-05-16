class Share::TripsController < ApplicationController
  layout "share"
  skip_before_action :validate_access
  before_action :set_trip_and_token
  
  def show
  end
  
  private
  
  def set_trip_and_token
    @trip_token = params[:trip_id] || params[:id]
    @trip = Trip.find_by_token_for(:sharing, @trip_token)
  end
end
