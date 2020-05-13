require 'test_helper'

class Admins::CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in admins(:admin)
    @category = categories(:category)
  end

  test "ジャンル一覧画面" do
    get admins_categories_path
    assert_template "categories/index"
  end

  test "ジャンル編集画面" do
    get edit_admins_category_path(@category)
    assert_template "categories/edit"
  end

  test "ジャンル新規追加（成功）" do
    get admins_categories_path
    assert_template "categories/index"
    assert_difference "Category.count", 1 do
      post admins_categories_path, params: { category: { name:  "アイス", is_active: true } }
    end
    assert_redirected_to admins_categories_path
  end

  test "ジャンル新規追加（失敗）" do
    get admins_categories_path
    assert_template "categories/index"
    post admins_categories_path, params: { category: { name:  "", is_active: true } }
    assert_select "div", "入力内容を確認してください"
    assert_template "categories/index"
  end

  test "ジャンル編集（成功）" do
    get edit_admins_category_path(@category)
    assert_template "categories/edit"
    patch admins_category_path(@category), params: { category: { name:  "アイス" } }
    assert_redirected_to admins_categories_path
  end

  test "ジャンル編集（失敗）" do
    get edit_admins_category_path(@category)
    assert_template "categories/edit"
    patch admins_category_path, params: { category: { name:  "" } }
    assert_select "div", "入力内容を確認してください"
    assert_template "categories/edit"
  end

end
