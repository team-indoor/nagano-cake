require 'test_helper'

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @member = members(:member1)
    sign_in @member
  end

  test "should get index" do
    get member_cart_items_path(@member)
    assert_response :success
  end

end
