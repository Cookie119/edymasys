require "test_helper"

class MasterTimetablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_timetable = master_timetables(:one)
  end

  test "should get index" do
    get master_timetables_url
    assert_response :success
  end

  test "should get new" do
    get new_master_timetable_url
    assert_response :success
  end

  test "should create master_timetable" do
    assert_difference("MasterTimetable.count") do
      post master_timetables_url, params: { master_timetable: { day: @master_timetable.day, division_id: @master_timetable.division_id, subject_id: @master_timetable.subject_id, teacher_id: @master_timetable.teacher_id, time_slot: @master_timetable.time_slot } }
    end

    assert_redirected_to master_timetable_url(MasterTimetable.last)
  end

  test "should show master_timetable" do
    get master_timetable_url(@master_timetable)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_timetable_url(@master_timetable)
    assert_response :success
  end

  test "should update master_timetable" do
    patch master_timetable_url(@master_timetable), params: { master_timetable: { day: @master_timetable.day, division_id: @master_timetable.division_id, subject_id: @master_timetable.subject_id, teacher_id: @master_timetable.teacher_id, time_slot: @master_timetable.time_slot } }
    assert_redirected_to master_timetable_url(@master_timetable)
  end

  test "should destroy master_timetable" do
    assert_difference("MasterTimetable.count", -1) do
      delete master_timetable_url(@master_timetable)
    end

    assert_redirected_to master_timetables_url
  end
end
