require 'rails_helper'

RSpec.describe "teacher_subjects/edit", type: :view do
  let(:teacher_subject) {
    TeacherSubject.create!(
      teacher: nil,
      subject: nil
    )
  }

  before(:each) do
    assign(:teacher_subject, teacher_subject)
  end

  it "renders the edit teacher_subject form" do
    render

    assert_select "form[action=?][method=?]", teacher_subject_path(teacher_subject), "post" do

      assert_select "input[name=?]", "teacher_subject[teacher_id]"

      assert_select "input[name=?]", "teacher_subject[subject_id]"
    end
  end
end
