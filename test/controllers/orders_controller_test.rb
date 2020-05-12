require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @member = members(:member1)
    sign_in @member
    @order = orders(:order)
  end

  test "should get index" do
    get member_orders_path(@member)
    assert_response :success
  end

  test "should get show" do
    get member_order_path(@member,@order)
    assert_response :success
  end

  test "should get new" do
    get new_member_order_path(@member)
    assert_response :success
  end

  test "should get confirmation" do
    get confirmation_member_orders_path(@member)
    assert_response :success
  end

  test "should get fixed" do
    get fixed_member_orders_path(@member)
    assert_response :success
  end

end
