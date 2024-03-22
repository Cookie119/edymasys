require "application_system_test_case"

class TimeslotAssignedTeachersTest < ApplicationSystemTestCase
  setup do
    @timeslot_assigned_teacher = timeslot_assigned_teachers(:one)
  end

  test "visiting the index" do
    visit timeslot_assigned_teachers_url
    assert_selector "h1", text: "Timeslot assigned teachers"
  end

  test "should create timeslot assigned teacher" do
    visit timeslot_assigned_teachers_url
    click_on "New timeslot assigned teacher"

    fill_in "Assigned teacher", with: @timeslot_assigned_teacher.assigned_teacher_id
    fill_in "Timeslot", with: @timeslot_assigned_teacher.timeslot_id
    click_on "Create Timeslot assigned teacher"

    assert_text "Timeslot assigned teacher was successfully created"
    click_on "Back"
  end

  test "should update Timeslot assigned teacher" do
    visit timeslot_assigned_teacher_url(@timeslot_assigned_teacher)
    click_on "Edit this timeslot assigned teacher", match: :first

    fill_in "Assigned teacher", with: @timeslot_assigned_teacher.assigned_teacher_id
    fill_in "Timeslot", with: @timeslot_assigned_teacher.timeslot_id
    click_on "Update Timeslot assigned teacher"

    assert_text "Timeslot assigned teacher was successfully updated"
    click_on "Back"
  end

  test "should destroy Timeslot assigned teacher" do
    visit timeslot_assigned_teacher_url(@timeslot_assigned_teacher)
    click_on "Destroy this timeslot assigned teacher", match: :first

    assert_text "Timeslot assigned teacher was successfully destroyed"
  end
end
