class ActivitiesController < ApplicationController
  before_action :set_render_to_happenings
  before_action :set_trip
  before_action :set_day, only: [ :new, :create ]
  
  def index
    @happenings = @trip.activities
  end
  
  def new
    @happening = Happening.new happeningable: Activity.new
  end
  
  def create
    @happening = Happening.record!(Activity.new(name: activity_params[:name], location: activity_params[:location]),
      trip: @trip,
      date: activity_params[:date],
      time: activity_params[:time],
      notes: activity_params[:notes],
      booked: activity_params[:booked]
      )
      
    redirect_to day_path(@day)
  end
  
  private
  
  def set_render_to_happenings
    lookup_context.prefixes.prepend 'happenings'
  end
  
  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
  
  def set_day
    @day = Day.find(params[:day])
  end
  
  def activity_params
    params.require(:happening).permit(:name, :location, :date, :notes, :time, :booked)
  end
end
