require "test_helper"

class ClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class = classes(:one)
  end

  test "should get index" do
    get classes_url
    assert_response :success
  end

  test "should get new" do
    get new_class_url
    assert_response :success
  end

  test "should create class" do
    assert_difference("Class.count") do
      post classes_url, params: { class: { class_name: @class.class_name, is_active: @class.is_active, is_deleted: @class.is_deleted } }
    end

    assert_redirected_to class_url(Class.last)
  end

  test "should show class" do
    get class_url(@class)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_url(@class)
    assert_response :success
  end

  test "should update class" do
    patch class_url(@class), params: { class: { class_name: @class.class_name, is_active: @class.is_active, is_deleted: @class.is_deleted } }
    assert_redirected_to class_url(@class)
  end

  test "should destroy class" do
    assert_difference("Class.count", -1) do
      delete class_url(@class)
    end

    assert_redirected_to classes_url
  end
end
