class Share::SometimesController < Share::TripsController
  def index
    @sometimes = @trip.sometimes.all
  end
end
