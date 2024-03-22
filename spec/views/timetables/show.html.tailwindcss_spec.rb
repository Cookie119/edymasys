require 'rails_helper'

RSpec.describe "timetables/show", type: :view do
  before(:each) do
    assign(:timetable, Timetable.create!(
      division: nil,
      day: nil,
      time_slot: nil,
      subject: nil,
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
