require "test_helper"

class TimeslotAssignedTeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timeslot_assigned_teacher = timeslot_assigned_teachers(:one)
  end

  test "should get index" do
    get timeslot_assigned_teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_timeslot_assigned_teacher_url
    assert_response :success
  end

  test "should create timeslot_assigned_teacher" do
    assert_difference("TimeslotAssignedTeacher.count") do
      post timeslot_assigned_teachers_url, params: { timeslot_assigned_teacher: { assigned_teacher_id: @timeslot_assigned_teacher.assigned_teacher_id, timeslot_id: @timeslot_assigned_teacher.timeslot_id } }
    end

    assert_redirected_to timeslot_assigned_teacher_url(TimeslotAssignedTeacher.last)
  end

  test "should show timeslot_assigned_teacher" do
    get timeslot_assigned_teacher_url(@timeslot_assigned_teacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_timeslot_assigned_teacher_url(@timeslot_assigned_teacher)
    assert_response :success
  end

  test "should update timeslot_assigned_teacher" do
    patch timeslot_assigned_teacher_url(@timeslot_assigned_teacher), params: { timeslot_assigned_teacher: { assigned_teacher_id: @timeslot_assigned_teacher.assigned_teacher_id, timeslot_id: @timeslot_assigned_teacher.timeslot_id } }
    assert_redirected_to timeslot_assigned_teacher_url(@timeslot_assigned_teacher)
  end

  test "should destroy timeslot_assigned_teacher" do
    assert_difference("TimeslotAssignedTeacher.count", -1) do
      delete timeslot_assigned_teacher_url(@timeslot_assigned_teacher)
    end

    assert_redirected_to timeslot_assigned_teachers_url
  end
end
