require 'test_helper'

class RecruiterControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recruiter_new_url
    assert_response :success
  end

  test "should get view" do
    get recruiter_view_url
    assert_response :success
  end

end
