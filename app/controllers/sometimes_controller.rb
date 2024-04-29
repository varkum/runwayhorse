class SometimesController < ApplicationController
  before_action :set_trip
  before_action :set_sometime, only: %i[ show edit update destroy ]

  def index
    @sometimes = @trip.sometimes.all
  end

  def new
    @sometime = Sometime.new
  end

  def edit
  end

  def create
    if sometime_params[:name].empty?
      redirect_to trip_sometimes_path(@trip)
    else
      @sometime = @trip.sometimes.create!(sometime_params)
      redirect_to trip_sometimes_path(@trip)
    end
  end

  def update
    if sometime_params[:name].empty?
      @sometime.destroy!
    else
      @sometime.update!(sometime_params)
    end

    redirect_to trip_sometimes_path(@sometime.trip)
  end

  def destroy
    @sometime.destroy!

    redirect_to sometimes_url, notice: "Sometime was successfully destroyed."
  end

  private
  
    def set_trip
      @trip = Current.user.trips.find(params[:trip_id])
    end

    def set_sometime
      @sometime = @trip.sometimes.find(params[:id])
    end

    def sometime_params
      params.require(:sometime).permit(:trip_id, :name, :completed)
    end
end
