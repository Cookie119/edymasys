require "test_helper"

class TimeTablesgetControllerTest < ActionDispatch::IntegrationTest
  test "should get admin/sign_up," do
    get time_tablesget_admin/sign_up,_url
    assert_response :success
  end

  test "should get to:" do
    get time_tablesget_to:_url
    assert_response :success
  end

  test "should get redirect(/admins/sign_in)" do
    get time_tablesget_redirect(/admins/sign_in)_url
    assert_response :success
  end
end
