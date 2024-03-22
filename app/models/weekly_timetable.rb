class WeeklyTimetable < ApplicationRecord
  belongs_to :day
  belongs_to :time_slot
  belongs_to :subject
  belongs_to :division
  belongs_to :teacher
end
