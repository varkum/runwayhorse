class Share::DaysController < Share::TripsController
  def show
    @day = @trip.days.find(params[:id])
  end
end
