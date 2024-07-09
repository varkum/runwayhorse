require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "sign up page redirects if signed in" do
    sign_in :one
    
    assert_redirected_to trips_url
  end
  
  test "sign up" do
    assert_difference -> { User.count }, +1 do
      post signup_url, params: { user: { name: "New Person", email: "new@gmail.com", password: "password123", password_confirmation: "password123" } }
    end
    
    assert_redirected_to new_trip_url
    
    user = User.last
    assert_equal user.id, session[:user_id]
  end
  
  test "can't signup twice" do
    assert_no_difference -> { User.count } do
      post signup_url, params: { user: { name: "Another Varun", email: "varun.kumar@hey.com", password: "password123", password_confirmation: "password123" } }
    end
    
    assert_response :unprocessable_entity
  end
end
    