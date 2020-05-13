require 'test_helper'

class Admins::HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in admins(:admin)
  end
  test "top page" do
    get admins_path
    assert_template "home/top"
    assert_select "h1.order-count", "本日の注文数　1　件"
  end
end
