class TransportationsController < ApplicationController
  before_action :set_render_to_happenings
  before_action :set_trip
  
  def index
    @happening = @trip.transportations
  end
  
  def new
    @happening = Happening.new happeningable: Transportation.new
  end
  
  def create
    @happening = Happening.create_transportation trip: @trip, date: transportation_params[:date], 
      time: transportation_params[:time], 
      transport_mode: transportation_params[:mode], 
      notes: transportation_params[:notes]
    redirect_to trip_transportations_path
  end
  
  private
  
  def set_render_to_happenings
    lookup_context.prefixes.prepend 'happenings'
  end
  
  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
  
  def transportation_params
    params.require(:transportation).permit(:date, :mode, :notes, :time)
  end
end
