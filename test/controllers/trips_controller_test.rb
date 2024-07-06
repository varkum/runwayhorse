require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in :one
  end

  test "index lists the current users's trips" do
    get trips_url
    
    assert_response :success
    assert_select "p", text: "Europe Summer"
    assert_select "p", text: "Spring Break", count: 0
  end
  
  test "index redirects to login if not signed in" do
    sign_out
    get trips_url
    
    asserts_redirect_to signin_url
  end
  
  test "creating a new trip sets it as active" do
    assert_difference -> { Trip.count }, +1 do
      post trips_url, params: { trip: { name: "New Trip", start_date: "2024-06-05", end_date: "2024-06-15" } }
    end
    
    trip = Trip.last
    assert_equal "New Trip", users(:one).active_trip.name
    assert_equal 11, trip.days.count

    assert_redirected_to trip_url(Trip.last)
  end
end
