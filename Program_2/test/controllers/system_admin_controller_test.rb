require 'test_helper'

class SystemAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get system_admin_index_url
    assert_response :success
  end

end
