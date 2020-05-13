require 'test_helper'

class Admins::ProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @category = categories(:category)
    @product = products(:product1)
    @product.category = @category
    sign_in admins(:admin)
  end

  test "商品一覧画面" do
    get admins_products_path
    assert_template "products/index"
    assert_select "a[href=?]", admins_product_path(@product), text: "ケーキ"
    assert_select "a[href=?]", new_admins_product_path
  end

  test "商品詳細画面" do
    get admins_product_path(@product)
    assert_template "products/show"
    assert_select "a[href=?]", edit_admins_product_path(@product)
  end

  test "商品新規登録画面" do
    get new_admins_product_path
    assert_template "products/new"
  end

  test "商品編集画面" do
    get edit_admins_product_path(@product)
    assert_template "products/edit"
  end

  test "商品の新規登録（成功）" do
    get new_admins_product_path
    assert_template "products/new"
    assert_difference "Product.count", 1 do
      post admins_products_path, params: { product: { category_id: @category.id, name: "ケーキ", price: 300, introduction: "説明", is_saling: true } }
    end
    follow_redirect!
    assert_template 'products/show'
  end

  test "商品の新規登録（失敗）" do
    get new_admins_product_path
    assert_template "products/new"
    assert_no_difference 'Product.count' do
      post admins_products_path, params: { product: { category: @category, name: "", price: 300, introduction: "説明", is_saling: true } }
    end
    assert_select "div", "入力内容を確認してください"
    assert_template 'products/new'
  end

  test "商品の情報編集（成功）" do
    get edit_admins_product_path(@product)
    assert_template "products/edit"
    patch admins_product_path(@product), params: { product: { name: "マカロン" } }
    assert_redirected_to admins_product_url(@product)
    follow_redirect!
    assert_template 'products/show'
  end

  test "商品の情報編集（失敗）" do
    get edit_admins_product_path(@product)
    assert_template "products/edit"
    patch admins_product_path(@product), params: { product: { name: "" } }
    assert_select "div", "入力内容を確認してください"
    assert_template "products/edit"
  end

end
