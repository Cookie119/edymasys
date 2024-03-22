require 'rails_helper'

RSpec.describe "weekly_timetables/show", type: :view do
  before(:each) do
    assign(:weekly_timetable, WeeklyTimetable.create!(
      day: nil,
      time_slot: nil,
      subject: nil,
      division: nil,
      teacher: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
