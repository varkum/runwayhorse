class ActivitiesController < ApplicationController
  before_action :set_render_to_happenings
  before_action :set_trip, only: %i[ index new create ]
  before_action :set_day, except: :index
  before_action :set_happening, only: %i[ edit update destroy ]
  
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
      notes: activity_params[:notes]
      )
      
    redirect_to day_path(@day), notice: "Activity added successfully"
  end
  
  def edit
  end
  
  def update
    @happening.update_meta_attributes!(activity_params.slice(:date, :time, :notes)) && @happening.activity.update!(activity_params.slice(:name, :location))
    
    redirect_to day_path(@day), notice: "Your changes were saved"
  end
  
  def destroy
    @happening.destroy!
    
    redirect_to day_path(@day), notice: "Activity was deleted successfully"
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
  
  def set_happening
    @happening = Happening.find(params[:id])
  end
  
  def activity_params
    params.require(:happening).permit(:name, :location, :date, :notes, :time)
  end
end
