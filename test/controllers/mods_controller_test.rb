require "test_helper"

class ModsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mods_index_url
    assert_response :success
  end
end
