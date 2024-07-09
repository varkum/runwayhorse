class Trips::SummariesController < ApplicationController
  allow_unauthenticated_access only: :index
  before_action :set_trip
  
  def index
    @transport_happenings = @trip.transportations
  end
  
  private
  
  def set_trip
    @trip = Trip.find(params[:trip_id])
    
    validate_shared_trip_token unless @trip
  end
end
