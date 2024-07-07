class TransportationsController < HappeningablesController 
  private
  
  def index_happeningables
    @trip.transportations
  end
  
  def new_happeningable
    Transportation.new happeningable_params
  end
  
  def happeningable_params
    params.fetch(:happening, {}).permit(:mode, :origin, :destination, :arrival)
  end
end
