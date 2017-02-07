require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get payment_status" do
    get :payment_status
    assert_response :success
  end

end
