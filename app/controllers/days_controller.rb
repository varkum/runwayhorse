class DaysController < ApplicationController
  #before_action :set_trip
  before_action :set_day, only: %i[ show edit update ]
  
  def show
  end
  
  def edit
  end
  
  def update
    @day.update(day_params)
    redirect_to day_path(@day)
  end
  
  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
  
  def set_day
    @day = Day.find(params[:id])
  end
  
  def day_params
    params.require(:day).permit(:homebase, :location, :notes)
  end
end
