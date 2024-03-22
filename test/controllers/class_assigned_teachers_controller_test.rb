require "test_helper"

class ClassAssignedTeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_assigned_teacher = class_assigned_teachers(:one)
  end

  test "should get index" do
    get class_assigned_teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_class_assigned_teacher_url
    assert_response :success
  end

  test "should create class_assigned_teacher" do
    assert_difference("ClassAssignedTeacher.count") do
      post class_assigned_teachers_url, params: { class_assigned_teacher: { school_class_id: @class_assigned_teacher.school_class_id, subject_id: @class_assigned_teacher.subject_id, teacher_id: @class_assigned_teacher.teacher_id } }
    end

    assert_redirected_to class_assigned_teacher_url(ClassAssignedTeacher.last)
  end

  test "should show class_assigned_teacher" do
    get class_assigned_teacher_url(@class_assigned_teacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_assigned_teacher_url(@class_assigned_teacher)
    assert_response :success
  end

  test "should update class_assigned_teacher" do
    patch class_assigned_teacher_url(@class_assigned_teacher), params: { class_assigned_teacher: { school_class_id: @class_assigned_teacher.school_class_id, subject_id: @class_assigned_teacher.subject_id, teacher_id: @class_assigned_teacher.teacher_id } }
    assert_redirected_to class_assigned_teacher_url(@class_assigned_teacher)
  end

  test "should destroy class_assigned_teacher" do
    assert_difference("ClassAssignedTeacher.count", -1) do
      delete class_assigned_teacher_url(@class_assigned_teacher)
    end

    assert_redirected_to class_assigned_teachers_url
  end
end
