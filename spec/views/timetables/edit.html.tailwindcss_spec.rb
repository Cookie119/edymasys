require 'rails_helper'

RSpec.describe "timetables/edit", type: :view do
  let(:timetable) {
    Timetable.create!(
      division: nil,
      day: nil,
      time_slot: nil,
      subject: nil,
      teacher: nil
    )
  }

  before(:each) do
    assign(:timetable, timetable)
  end

  it "renders the edit timetable form" do
    render

    assert_select "form[action=?][method=?]", timetable_path(timetable), "post" do

      assert_select "input[name=?]", "timetable[division_id]"

      assert_select "input[name=?]", "timetable[day_id]"

      assert_select "input[name=?]", "timetable[time_slot_id]"

      assert_select "input[name=?]", "timetable[subject_id]"

      assert_select "input[name=?]", "timetable[teacher_id]"
    end
  end
end
