require 'test_helper'

class Admins::MembersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @member = members(:member1)
    @other_member = members(:member2)
    sign_in admins(:admin)
  end
  test "会員一覧画面" do
    get admins_members_path
    assert_response :success
    assert_select "a[href=?]", admins_member_path(@member), text: "神谷 敏生"
  end

  test "会員詳細画面" do
    get admins_member_path(@member)
    assert_response :success
    assert_select "a[href=?]", edit_admins_member_path(@member)
    assert_select "a[href=?]", admins_orders_path
  end

  test "編集画面" do
    get edit_admins_member_path(@member)
    assert_response :success
  end

  test "会員情報の編集（成功）" do
    get edit_admins_member_path(@member)
    assert_template 'members/edit'
    patch admins_member_path(@member), params: { member: { last_name:  "kamiya" } }
    assert_redirected_to admins_member_path(@member)
    @member.reload
    assert_equal "kamiya", @member.last_name
    follow_redirect!
    assert_template "members/show"
  end

  test "会員情報の編集（失敗）" do
    get edit_admins_member_path(@member)
    assert_template 'members/edit'
    patch admins_member_path(@member), params: { member: { last_name:  "" } }
    assert_select "div", "入力内容を確認してください"
    assert_template "members/edit"
  end

end
