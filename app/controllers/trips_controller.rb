class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]

  def index
    @trips = Current.user.trips
  end

  def show
  end

  def new
    @trip = Current.user.trips.last
  end

  def edit
  end

  def create
    @trip = Current.user.trips.last
    if @trip.update!(trip_params)
      Current.user.active_label.update! trip: @trip
      redirect_to trip_url(@trip), notice: "Your trip was created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @trip.update!(trip_params)
      redirect_to trip_url(@trip), turbo: false
    else
      redirect_to trip_url(@trip), alert: "Your changes weren't saved. Please try again"
    end
  end

  def destroy
    @trip.destroy!

    redirect_to trips_url, notice: "Trip was successfully destroyed."
  end

  private

    def set_trip
      @trip = Current.user.trips.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date, :notes)
    end
end
