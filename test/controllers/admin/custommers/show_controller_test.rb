require "test_helper"

class Admin::Custommers::ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_custommers_show_show_url
    assert_response :success
  end
end
