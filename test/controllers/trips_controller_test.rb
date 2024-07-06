require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in :one
  end

  test "index lists the current users's trips" do
    sign_in :two
    
    get trips_url
    
    assert_response :success
    assert_select "p", text: "Spring Break"
    assert_select "p", text: "Untitled", count: 0
  end
  
  test "index redirects to login if not signed in" do
    sign_out
    get trips_url
    
    assert_redirected_to signin_url
  end
  
  test "creating a new trip sets it as active" do
    post trips_url, params: { trip: { name: "Europe Summer", start_date: "2024-06-05", end_date: "2024-06-15" } }
    
    trip = Trip.last
    assert_equal "Europe Summer", trip.name
    assert_equal "Europe Summer", users(:one).active_trip.name
    assert_equal 11, trip.days.count

    assert_redirected_to trip_url(Trip.last)
  end
end
