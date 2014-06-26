require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "login and browse site" do
    get "/logins/new"
    assert_response :success
  end
end
