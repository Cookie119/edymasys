require 'rails_helper'

RSpec.describe "weekly_timetables/edit", type: :view do
  let(:weekly_timetable) {
    WeeklyTimetable.create!(
      day: nil,
      time_slot: nil,
      subject: nil,
      division: nil,
      teacher: nil
    )
  }

  before(:each) do
    assign(:weekly_timetable, weekly_timetable)
  end

  it "renders the edit weekly_timetable form" do
    render

    assert_select "form[action=?][method=?]", weekly_timetable_path(weekly_timetable), "post" do

      assert_select "input[name=?]", "weekly_timetable[day_id]"

      assert_select "input[name=?]", "weekly_timetable[time_slot_id]"

      assert_select "input[name=?]", "weekly_timetable[subject_id]"

      assert_select "input[name=?]", "weekly_timetable[division_id]"

      assert_select "input[name=?]", "weekly_timetable[teacher_id]"
    end
  end
end
