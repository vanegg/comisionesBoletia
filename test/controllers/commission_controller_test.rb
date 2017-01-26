require 'test_helper'

class CommissionControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get commission_home_url
    assert_response :success
  end

end
