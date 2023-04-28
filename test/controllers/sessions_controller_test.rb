require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get auth_login_path
    assert_response :success


  end

  test "should create session" do
    user = users(:one)
    post auth_login_path, params: { session_request: {email: user.email, password: 'secret'}}
    # assert_redirected_to root_path
    assert_equal user.id, session[:user_id]
  end

  test "should NOT create session" do
    user = users(:one)
    post auth_login_path, params: { session_request: {email: user.email, password: 'not secret'}}
    assert_response :unauthorized
    assert_nil session[:user_id]
    assert_template :new
  end

  test "should destroy session" do 
    delete auth_logout_path
    assert_redirected_to root_path
    assert_nil session[:user_id]
  end
end
