class DaysController < ApplicationController
  include SetTripDay
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

  def day_params
    params.require(:day).permit(:homebase, :location, :notes)
  end
end
