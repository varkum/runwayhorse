class Trips::SummariesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @transport_happenings = @trip.transportations
  end
end
