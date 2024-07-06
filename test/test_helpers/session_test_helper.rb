module SessionTestHelper
  def sign_in(user)
    user = users(user)
    post signin_url, params: { email_address: user.email_address, password: "password123" }
    assert session[:user_id].present?
  end
  
  def sign_out
    delete signout_url
    assert_not session[:user_id].present?
  end
end
