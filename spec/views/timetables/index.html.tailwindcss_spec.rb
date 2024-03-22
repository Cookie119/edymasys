require 'rails_helper'

RSpec.describe "timetables/index", type: :view do
  before(:each) do
    assign(:timetables, [
      Timetable.create!(
        division: nil,
        day: nil,
        time_slot: nil,
        subject: nil,
        teacher: nil
      ),
      Timetable.create!(
        division: nil,
        day: nil,
        time_slot: nil,
        subject: nil,
        teacher: nil
      )
    ])
  end

  it "renders a list of timetables" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
