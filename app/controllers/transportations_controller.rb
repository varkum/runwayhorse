class TransportationsController < ApplicationController
  before_action :set_trip
  
  def index
    @transportations = @trip.transportations
  end
  
  def new
    @transportation = Transportation.new
  end
  
  def create
    Happening.create_transportation trip: @trip, date: transportation_params[:date], 
      time: transportation_params[:time], 
      transport_mode: transportation_params[:mode], 
      notes: transportation_params[:notes]
    redirect_to trip_transportations_path
  end
  
  private
  
  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
  
  def transportation_params
    params.require(:transportation).permit(:date, :mode, :notes, :time)
  end
end
