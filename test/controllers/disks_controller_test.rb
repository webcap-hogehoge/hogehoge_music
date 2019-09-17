require 'test_helper'

class DisksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get disks_new_url
    assert_response :success
  end

end
