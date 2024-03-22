require "test_helper"

class MakerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get maker_index_url
    assert_response :success
  end
end
