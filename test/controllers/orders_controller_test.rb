require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @member = members(:member1)
    @order = orders(:order)
  end

  test "注文一覧画面の取得" do
    sign_in @member
    get member_orders_path(@member)
    assert_template 'orders/index'
    assert_response :success
  end

  test "注文詳細画面の取得" do
    sign_in @member
    get member_order_path(@member,@order)
    assert_template 'orders/show'
    assert_response :success
  end

  test "注文情報入力画面の取得" do
    sign_in @member
    get new_member_order_path(@member)
    assert_template 'orders/new'
    assert_response :success
  end

  test "注文内容確認画面の取得" do
    sign_in @member
    get confirmation_member_orders_path(@member)
    assert_template 'orders/confirmation'
    assert_response :success
  end

  test "注文確定画面の取得" do
    sign_in @member
    get fixed_member_orders_path(@member)
    assert_template 'orders/fixed'
    assert_response :success
  end

  test "注文することに成功" do
    sign_in @member
    post member_orders_path(@member), params: { order: { member_id: @member.id,
                                                          total_price: 1000,
                                                          postage: 800,
                                                          payment: 1,
                                                          reciever: "岡田",
                                                          postal_code: 1235678,
                                                          address: "埼玉県",
                                                          order_status: 0 }}
    assert_redirected_to fixed_member_orders_path(@member)
  end

end
