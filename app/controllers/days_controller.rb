class DaysController < ApplicationController
  allow_unauthenticated_access, only: :show
  before_action :set_trip
  before_action :set_day, only: %i[ show edit update ]
  
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
    @trip = Current.user.trips.find(params[:trip_id])
  end

  def set_day
    @day = @trip.days.find(params[:id])
  end

  def day_params
    params.require(:day).permit(:homebase, :location, :notes)
  end
end
