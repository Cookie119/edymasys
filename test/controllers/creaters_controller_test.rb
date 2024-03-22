require "test_helper"

class CreatersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get creaters_index_url
    assert_response :success
  end
end
