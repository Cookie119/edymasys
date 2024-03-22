json.extract! timetable, :id, :division_id, :day_id, :time_slot_id, :subject_id, :teacher_id, :created_at, :updated_at
json.url timetable_url(timetable, format: :json)
