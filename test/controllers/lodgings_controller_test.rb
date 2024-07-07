require "test_helper"

class LodgingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in :one
  end
  
  test "index brings up trip lodgings by start date" do
    get trip_lodgings_url(trips(:three))
    
    assert_select "p", "Hotel One"
    assert_select "p", "Hotel Three"
    assert_select "p", text: "Hotel Two", count: 0
  end
  
  test "create properly assigns days" do
    sign_in :two
    
    post trip_lodgings_url(trips(:two)), params: { lodging: { name: "Another Hotel", start_date: "2024-03-21", end_date: "2024-03-22" } }
    
    lodgings = trips(:two).lodgings
    newest_lodging = lodgings.last
    
    assert_equal 2, lodgings.count
    assert_equal "Another Hotel", newest_lodging.name
    assert_equal 2, newest_lodging.days.count
    assert_equal days(:four), newest_lodging.days.last
  end
  
  test "update" do
    sign_in :two
    
    patch trip_lodging_url(trips(:two), lodgings(:two)), params: { lodging: { name: "Hotel Two", start_date: "2024-03-20", end_date: "2024-03-22" } }
    
    lodging = trips(:two).lodgings.last
    assert_equal 3, lodging.days.count
    assert_equal days(:four), lodging.days.last
  end
end
