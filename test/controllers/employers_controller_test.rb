require "test_helper"

class EmployersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get employers_show_url
    assert_response :success
  end

  test "should get edit" do
    get employers_edit_url
    assert_response :success
  end
end
