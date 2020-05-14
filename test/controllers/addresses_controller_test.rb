require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @member = members(:member1)
    @address = addresses(:address)
    @other_member = members(:member2)
  end

  test "アドレス一覧画面の取得" do
    sign_in @member
    get member_addresses_path(@member)
    assert_template 'addresses/index'
    assert_response :success
  end

  test "アドレス編集画面の取得" do
    sign_in @member
    get edit_member_address_path(@member,@address)
    assert_template 'addresses/edit'
    assert_response :success
  end

  test "アドレス新規作成に成功" do
    sign_in @member
    get member_addresses_path(@member)
    post member_addresses_path(@member), params: { address: { member_id: @member.id,
                                                              reciever: "岡田",
                                                              postal_code: 1235678,
                                                              address: "埼玉県"}}
    assert_redirected_to member_addresses_path(@member)
  end

  test "アドレス新規作成に失敗" do
    sign_in @member
    get member_addresses_path(@member)
    post member_addresses_path(@member), params: { address: { member_id: @member.id,
                                                              reciever: "　",
                                                              postal_code: 1235678,
                                                              address: "　"}}
    assert_select "div", "入力内容を確認してください"
    assert_template 'addresses/index'
  end

  test "アドレスの編集に成功" do
    sign_in @member
    get edit_member_address_path(@member,@address)
    reciever = "Foo"
    patch member_address_path(@member,@address), params: { address: { reciever: reciever}}
    assert_redirected_to member_addresses_path
    @address.reload
    assert_equal reciever, @address.reciever
  end

  test "アドレスの編集に失敗" do
    sign_in @member
    get edit_member_address_path(@member,@address)
    patch member_address_path(@member,@address), params: { address: { reciever: " "}}
    assert_select "div", "入力内容を確認してください"
    assert_template 'addresses/edit'
  end

  test "アドレスの削除に成功" do
    sign_in @member
    get member_addresses_path(@member)
    assert_difference 'Address.count', -1 do
      delete member_address_path(@member,@address)
    end
  end

  test "他のメンバーが別のメンバーのアドレス編集画面に遷移した場合の検証" do
    sign_in @other_member
    get edit_member_address_path(@member,@address)
    assert_redirected_to root_path
  end

end
