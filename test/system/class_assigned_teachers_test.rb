require "application_system_test_case"

class ClassAssignedTeachersTest < ApplicationSystemTestCase
  setup do
    @class_assigned_teacher = class_assigned_teachers(:one)
  end

  test "visiting the index" do
    visit class_assigned_teachers_url
    assert_selector "h1", text: "Class assigned teachers"
  end

  test "should create class assigned teacher" do
    visit class_assigned_teachers_url
    click_on "New class assigned teacher"

    fill_in "School class", with: @class_assigned_teacher.school_class_id
    fill_in "Subject", with: @class_assigned_teacher.subject_id
    fill_in "Teacher", with: @class_assigned_teacher.teacher_id
    click_on "Create Class assigned teacher"

    assert_text "Class assigned teacher was successfully created"
    click_on "Back"
  end

  test "should update Class assigned teacher" do
    visit class_assigned_teacher_url(@class_assigned_teacher)
    click_on "Edit this class assigned teacher", match: :first

    fill_in "School class", with: @class_assigned_teacher.school_class_id
    fill_in "Subject", with: @class_assigned_teacher.subject_id
    fill_in "Teacher", with: @class_assigned_teacher.teacher_id
    click_on "Update Class assigned teacher"

    assert_text "Class assigned teacher was successfully updated"
    click_on "Back"
  end

  test "should destroy Class assigned teacher" do
    visit class_assigned_teacher_url(@class_assigned_teacher)
    click_on "Destroy this class assigned teacher", match: :first

    assert_text "Class assigned teacher was successfully destroyed"
  end
end
