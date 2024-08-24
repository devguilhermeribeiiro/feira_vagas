require "test_helper"

class JobSeekersControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get job_seekers_profile_url
    assert_response :success
  end

  test "should get edit" do
    get job_seekers_edit_url
    assert_response :success
  end

  test "should get update" do
    get job_seekers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get job_seekers_destroy_url
    assert_response :success
  end
end
