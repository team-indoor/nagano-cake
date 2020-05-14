require 'test_helper'

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @member = members(:member1)
    @product = products(:product1)
    @cart_item = cart_items(:cart_item)
    @cart_item2 = cart_items(:cart_item2)
    @other_member = members(:member2)
  end

  test "カート一覧画面の取得" do
    sign_in @member
    get member_cart_items_path(@member)
    assert_template 'cart_items/index'
    assert_response :success
  end

  test "カートに商品を追加し失敗する" do
    sign_in @member
    post member_cart_items_path(@member), params: { cart_item: { member_id: @member,
                                                                product_id: @product,
                                                                amount: ""}}
    assert_template 'cart_items/index'
  end

  test "カート商品の数量を変更し成功する" do
    sign_in @member
    get member_cart_items_path(@member)
    patch member_cart_item_path(@member,@cart_item), params: { cart_item: { amount: 10}}
    assert_redirected_to member_cart_items_path
  end

  test "カートの商品が重複した場合の検証" do
    sign_in @member
    duplicate_cart_item = @cart_item.dup
    @cart_item.save
    assert_not duplicate_cart_item.valid?
  end

  test "カート内の商品の削除に成功（単体）" do
    sign_in @member
    get member_cart_items_path(@member)
    @cart_item.save
    assert_difference 'CartItem.count', -1 do
      delete member_cart_item_path(@member,@cart_item)
    end
  end

  test "カート内の商品の削除に成功（全て）" do
    sign_in @member
    get member_cart_items_path(@member)
    assert_difference 'CartItem.count', -2 do
      delete destroy_all_member_cart_items_path(@member)
    end
  end

  test "他のメンバーが別のメンバーのカート一覧画面に遷移した場合の検証" do
    sign_in @other_member
    get member_cart_items_path(@member)
    assert_redirected_to root_path
  end

end
