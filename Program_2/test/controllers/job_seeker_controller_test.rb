require 'test_helper'

class JobSeekerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_seeker_index_url
    assert_response :success
  end

end
