class Share::SummariesController < Share::TripsController
  def index
     @transport_happenings = @trip.transportations
  end
end
