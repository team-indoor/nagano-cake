require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @product = products(:product1)
    @category = categories(:category)
  end

  test "商品の一覧画面の取得（全商品）" do
    get products_path
    assert_response :success
  end

  test "商品の詳細画面の取得" do
    get product_path(@product)
    assert_response :success
  end

  test "商品の一覧画面の取得（カテゴリー別）" do
    get products_path(category_id: @category.id)
    #assert_select "div", @category.name
    assert_response :success
  end

end
