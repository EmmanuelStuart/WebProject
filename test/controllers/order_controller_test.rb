require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get cart" do
    get order_cart_url
    assert_response :success
  end

end
