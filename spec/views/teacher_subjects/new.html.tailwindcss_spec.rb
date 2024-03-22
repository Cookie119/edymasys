require 'rails_helper'

RSpec.describe "teacher_subjects/new", type: :view do
  before(:each) do
    assign(:teacher_subject, TeacherSubject.new(
      teacher: nil,
      subject: nil
    ))
  end

  it "renders new teacher_subject form" do
    render

    assert_select "form[action=?][method=?]", teacher_subjects_path, "post" do

      assert_select "input[name=?]", "teacher_subject[teacher_id]"

      assert_select "input[name=?]", "teacher_subject[subject_id]"
    end
  end
end
