require 'rails_helper'

RSpec.describe "teacher_subjects/show", type: :view do
  before(:each) do
    assign(:teacher_subject, TeacherSubject.create!(
      teacher: nil,
      subject: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
