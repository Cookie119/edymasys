require "application_system_test_case"

class MasterTimetablesTest < ApplicationSystemTestCase
  setup do
    @master_timetable = master_timetables(:one)
  end

  test "visiting the index" do
    visit master_timetables_url
    assert_selector "h1", text: "Master timetables"
  end

  test "should create master timetable" do
    visit master_timetables_url
    click_on "New master timetable"

    fill_in "Day", with: @master_timetable.day
    fill_in "Division", with: @master_timetable.division_id
    fill_in "Subject", with: @master_timetable.subject_id
    fill_in "Teacher", with: @master_timetable.teacher_id
    fill_in "Time slot", with: @master_timetable.time_slot
    click_on "Create Master timetable"

    assert_text "Master timetable was successfully created"
    click_on "Back"
  end

  test "should update Master timetable" do
    visit master_timetable_url(@master_timetable)
    click_on "Edit this master timetable", match: :first

    fill_in "Day", with: @master_timetable.day
    fill_in "Division", with: @master_timetable.division_id
    fill_in "Subject", with: @master_timetable.subject_id
    fill_in "Teacher", with: @master_timetable.teacher_id
    fill_in "Time slot", with: @master_timetable.time_slot
    click_on "Update Master timetable"

    assert_text "Master timetable was successfully updated"
    click_on "Back"
  end

  test "should destroy Master timetable" do
    visit master_timetable_url(@master_timetable)
    click_on "Destroy this master timetable", match: :first

    assert_text "Master timetable was successfully destroyed"
  end
end
