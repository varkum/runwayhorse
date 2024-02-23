class TransportationsController < ApplicationController
  before_action :set_render_to_happenings
  before_action :set_trip
  
  def index
    @happenings = @trip.transportations
  end
  
  def new
    @happening = Happening.new happeningable: Transportation.new
  end
  
  def create
    @happening = Happening.record!(Transportation.new(origin: transportation_params[:from], destination: transportation_params[:to],
      mode: transportation_params[:mode]),
      trip: @trip,
      date: transportation_params[:date],
      time: transportation_params[:time],
      notes: transportation_params[:notes],
      booked: true
      )
    
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
    params.require(:happening).permit(:origin, :destination, :date, :mode, :notes, :time)
  end
end
