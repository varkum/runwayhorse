class Share::LodgingsController < Share::TripsController
  def index
    @lodgings = @trip.lodgings
  end
end
