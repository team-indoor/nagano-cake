require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @member = members(:member1)
    sign_in @member
    @address = addresses(:address)
  end

  test "should get index" do
    get member_addresses_path(@member)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_address_path(@member,@address)
    assert_response :success
  end

end
