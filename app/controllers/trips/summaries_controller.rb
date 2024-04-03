class Trips::SummariesController < ApplicationController
  skip_before_action :authenticate
  
  def index
    @trip = Trip.find(params[:trip_id])
    @transport_happenings = @trip.transportations
  end
end