require "application_system_test_case"

class ClassesTest < ApplicationSystemTestCase
  setup do
    @class = classes(:one)
  end

  test "visiting the index" do
    visit classes_url
    assert_selector "h1", text: "Classes"
  end

  test "should create class" do
    visit classes_url
    click_on "New class"

    fill_in "Class name", with: @class.class_name
    check "Is active" if @class.is_active
    check "Is deleted" if @class.is_deleted
    click_on "Create Class"

    assert_text "Class was successfully created"
    click_on "Back"
  end

  test "should update Class" do
    visit class_url(@class)
    click_on "Edit this class", match: :first

    fill_in "Class name", with: @class.class_name
    check "Is active" if @class.is_active
    check "Is deleted" if @class.is_deleted
    click_on "Update Class"

    assert_text "Class was successfully updated"
    click_on "Back"
  end

  test "should destroy Class" do
    visit class_url(@class)
    click_on "Destroy this class", match: :first

    assert_text "Class was successfully destroyed"
  end
end
