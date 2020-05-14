require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @member = members(:member1)
    @other_member = members(:member2)
  end

  test "@memberが有効か" do
    assert @member.valid?
  end

  test "バリデーションの有効性を検証（空白）" do
    @member.last_name = "     "
    assert_not @member.valid?
  end

  test "バリデーションの有効性を検証（文字数）" do
    @member.postal_code = "1" * 100
    assert_not @member.valid?
  end

  test "メンバーの詳細画面を取得" do
    sign_in @member
    get member_path(@member)
    assert_response :success
  end

  test "メンバーの編集画面を取得" do
    sign_in @member
    get edit_member_path(@member)
    assert_response :success
  end

  test "メンバーの退会画面を取得" do
    sign_in @member
    get delete_member_path(@member)
    assert_response :success
  end

  test "Deviseのバリデーションの検証" do
    duplicate_member = @member.dup
    @member.save
    assert_not duplicate_member.valid?
  end

  test "メンバー編集に失敗" do
    sign_in @member
    get edit_member_path(@member)
    assert_template 'members/edit'
    patch member_path(@member), params: { member: { postal_code: "12345678"}}
    assert_select "div", "入力内容を確認してください"
    assert_template 'members/edit'
  end

  test "メンバー編集に成功" do
    sign_in @member
    get edit_member_path(@member)
    assert_template 'members/edit'
    name1 = "Foo"
    name2 = "Bar"
    email = "foo@bar.com"
    patch member_path(@member), params: { member: { last_name: name1,
                                                    first_name: name2,
                                                    email: email}}
    assert_redirected_to member_path
    @member.reload
    assert_equal name1, @member.last_name
    assert_equal name2, @member.first_name
    assert_equal email, @member.email
  end

  test "他のメンバーが別のメンバーの編集画面に遷移した場合の検証" do
    sign_in @other_member
    get edit_member_path(@member)
    assert_redirected_to root_path
  end

  test "他のメンバーが別のメンバーの編集を更新しようとした場合の検証" do
    sign_in @other_member
    patch member_path(@member), params: { member: { email: @member.email } }
    assert_redirected_to root_path
  end

end
