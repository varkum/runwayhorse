class Share::TransportationsController < Share::TripsController
  before_action :set_render_to_happenings
  
  def index
    @happenings = @trip.transportations
  end
  
  private
  
  def set_render_to_happenings
    lookup_context.prefixes.prepend "share/happenings"
  end
end
