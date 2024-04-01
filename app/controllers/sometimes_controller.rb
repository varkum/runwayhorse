class SometimesController < ApplicationController
  before_action :set_trip, only: %i[ index new create ]
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
    @sometime = @trip.sometimes.new(sometime_params)
    
    
    if @sometime.save
      redirect_to trip_sometimes_path(@trip)

    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @sometime.update(sometime_params)
      redirect_to sometime_url(@sometime), notice: "Sometime was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sometime.destroy!

    redirect_to sometimes_url, notice: "Sometime was successfully destroyed."
  end

  private
  
    def set_sometime
      @sometime = Sometime.find(params[:id])
    end
    
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def sometime_params
      params.require(:sometime).permit(:trip_id, :name, :completed)
    end
end
