require 'test_helper'

class UserEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get controller" do
    get user_events_controller_url
    assert_response :success
  end

end
