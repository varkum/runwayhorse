class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def edit
  end

  def create
    @trip = Current.user.trips.new(trip_params)

    if @trip.save
      @trip.create_and_setup_days
      redirect_to trip_url(@trip), notice: "Trip was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @trip.update!(trip_params)
      redirect_to trip_url(@trip)
    else
      @trip.errors.add("Trip name can't be blank")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.destroy!

    respond_to do |format|
      format.html { redirect_to trips_url, notice: "Trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date)
    end
end
