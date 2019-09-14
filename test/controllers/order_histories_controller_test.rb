require 'test_helper'

class OrderHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get order_histories_new_url
    assert_response :success
  end

  test "should get confirm" do
    get order_histories_confirm_url
    assert_response :success
  end

  test "should get thanks" do
    get order_histories_thanks_url
    assert_response :success
  end

  test "should get index" do
    get order_histories_index_url
    assert_response :success
  end

  test "should get show" do
    get order_histories_show_url
    assert_response :success
  end

end
