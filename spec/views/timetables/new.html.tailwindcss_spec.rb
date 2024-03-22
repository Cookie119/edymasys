require 'rails_helper'

RSpec.describe "timetables/new", type: :view do
  before(:each) do
    assign(:timetable, Timetable.new(
      division: nil,
      day: nil,
      time_slot: nil,
      subject: nil,
      teacher: nil
    ))
  end

  it "renders new timetable form" do
    render

    assert_select "form[action=?][method=?]", timetables_path, "post" do

      assert_select "input[name=?]", "timetable[division_id]"

      assert_select "input[name=?]", "timetable[day_id]"

      assert_select "input[name=?]", "timetable[time_slot_id]"

      assert_select "input[name=?]", "timetable[subject_id]"

      assert_select "input[name=?]", "timetable[teacher_id]"
    end
  end
end
