class ActivitiesController < HappeningablesController
  private
  
  def index_happeningables
    @trip.activities
  end
  
  def new_happeningable
    Activity.new happeningable_params
  end
  
  def happeningable_params
    params.fetch(:activity, {}).permit(:name, :location)
  end
end
