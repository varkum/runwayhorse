require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "redirect if signed in" do
    sign_in :one
    
    get signin_url
    
    assert_redirected_to root_url
  end
  
  test "successful signin" do
    post signin_url, params: { email: "varun.kumar@hey.com", password: "password123" }
    
    assert_equal users(:one).id, session[:user_id]
    assert_redirected_to trips_url
  end
  
  test "unsuccessful signin" do
    post signin_url, params: { email: "varun.kumar@hey.com", password: "wrongpassword" }
    
    assert_nil session[:user_id]
    assert_redirected_to signin_url
  end
  
  test "signout" do
    sign_in :one
    
    delete signout_url
  
    assert_nil session[:user_id]
    assert_redirected_to signin_url
  end
end
