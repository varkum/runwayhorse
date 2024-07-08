class Trips::SummariesController < ApplicationController
  allow_unauthenticated_access only: :index
  
  def index
    @trip = Trip.find(params[:trip_id])
    @transport_happenings = @trip.transportations
  end
end
