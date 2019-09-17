require 'test_helper'

class ArrivalHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get arrival_histories_new_url
    assert_response :success
  end

end
