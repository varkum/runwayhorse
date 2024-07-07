class ActivitiesController < HappeningablesController
  private
  
  def index_happeningables
    @trip.activities
  end
  
  def new_happeningable
    Activity.new happeningable_params
  end
  
  def happeningable_params
    form_params.extract! *Activity::FORM_PARAMS
  end
end
