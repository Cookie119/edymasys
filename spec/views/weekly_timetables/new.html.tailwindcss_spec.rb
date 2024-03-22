require 'rails_helper'

RSpec.describe "weekly_timetables/new", type: :view do
  before(:each) do
    assign(:weekly_timetable, WeeklyTimetable.new(
      day: nil,
      time_slot: nil,
      subject: nil,
      division: nil,
      teacher: nil
    ))
  end

  it "renders new weekly_timetable form" do
    render

    assert_select "form[action=?][method=?]", weekly_timetables_path, "post" do

      assert_select "input[name=?]", "weekly_timetable[day_id]"

      assert_select "input[name=?]", "weekly_timetable[time_slot_id]"

      assert_select "input[name=?]", "weekly_timetable[subject_id]"

      assert_select "input[name=?]", "weekly_timetable[division_id]"

      assert_select "input[name=?]", "weekly_timetable[teacher_id]"
    end
  end
end
