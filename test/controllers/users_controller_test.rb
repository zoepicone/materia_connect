require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show for user" do
    get user_url(users(:one))
    assert_response :success
  end
end
