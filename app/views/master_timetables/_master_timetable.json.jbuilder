json.extract! master_timetable, :id, :day, :time_slot, :subject_id, :division_id, :teacher_id, :created_at, :updated_at
json.url master_timetable_url(master_timetable, format: :json)
