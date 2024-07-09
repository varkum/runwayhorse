class TransportationsController < HappeningablesController 
  private
  
  def index_happeningables
    @trip.transportations
  end
  
  def new_happeningable
    Transportation.new happeningable_params
  end
  
  def happeningable_params
    form_params.extract! *Transportation::FORM_PARAMS
  end
end
