class ActivitiesController < ApplicationController
  before_action :set_render_to_happenings
  before_action :set_trip
  
  def index
    @happenings = @trip.activities
  end
  
  def new
    @happening = Happening.new happeningable: Activity.new
  end
  
  def create
    @happening = Happening.create_activity trip: @trip, 
      name: activity_params[:name],
      location: activity_params[:location],
      date: activity_params[:date], 
      time: activity_params[:time], 
      notes: activity_params[:notes],
      booked: activity_params[:booked]
    redirect_to trip_activities_path
  end
  
  private
  
  def set_render_to_happenings
    lookup_context.prefixes.prepend 'happenings'
  end
  
  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
  
  def activity_params
    params.require(:happening).permit(:name, :location, :date, :notes, :time, :booked)
  end
end
