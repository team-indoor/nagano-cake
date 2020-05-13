require 'test_helper'

class Admins::OrdersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in admins(:admin)
    @member = members(:member1)
    @order = orders(:order)
    @order.member = @member
  end
  test "一覧ページ" do
    get admins_orders_path
    assert_template "orders/index"
    assert_select "a[href=?]", admins_order_path(@order)
  end

  test "詳細ページ" do
    get admins_order_path(@order)
    assert_template "orders/show"
    assert_select "a[href=?]", admins_member_path(@member), text: "神谷 敏生"
  end

  test "注文ステータスの変更" do
    get admins_order_path(@order)
    assert_template "orders/show"
    assert_select "option", count: 5
  end

end
