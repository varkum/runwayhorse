class DaysController < ApplicationController
  before_action :set_trip
  before_action :set_day
  
  allow_unauthenticated_access only: :show
  
  def show
  end

  def edit
  end

  def update
    @day.update!(day_params)

    redirect_to trip_day_path(@trip, @day)
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
