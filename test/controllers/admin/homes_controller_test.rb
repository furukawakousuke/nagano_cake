require "test_helper"

class Admin::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_homes_new_url
    assert_response :success
  end
end
