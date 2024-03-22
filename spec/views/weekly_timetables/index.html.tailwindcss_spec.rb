require 'rails_helper'

RSpec.describe "weekly_timetables/index", type: :view do
  before(:each) do
    assign(:weekly_timetables, [
      WeeklyTimetable.create!(
        day: nil,
        time_slot: nil,
        subject: nil,
        division: nil,
        teacher: nil
      ),
      WeeklyTimetable.create!(
        day: nil,
        time_slot: nil,
        subject: nil,
        division: nil,
        teacher: nil
      )
    ])
  end

  it "renders a list of weekly_timetables" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
