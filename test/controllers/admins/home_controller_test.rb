require 'test_helper'

class Admins::HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in admins(:admin)
  end
  test "should get top" do
    get admins_path
    assert_response :success
  end

end
