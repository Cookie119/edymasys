# app/models/master_timetable.rb
class MasterTimetable < ApplicationRecord
  belongs_to :day
  belongs_to :time_slot
  belongs_to :subject
  belongs_to :division
  belongs_to :teacher
  has_many :timetable_entries
  accepts_nested_attributes_for :timetable_entries

  
  validate :validate_day
  validate :validate_time_slot
  validate :validate_subject
  validate :validate_division
  validate :validate_teacher
  
  def duration
    # Calculate the duration based on the time_slot start_time and end_time
    time_slot.end_time - time_slot.start_time if time_slot
  end
  
  validates :day_id, :time_slot_id, :subject_id, :division_id, :teacher_id, presence: true
  validate :unique_time_slot_for_day_and_division
  validate :teacher_availability


  private

  def unique_time_slot_for_day_and_division
    existing_record = MasterTimetable.find_by(division_id: division_id, day_id: day_id, time_slot_id: time_slot_id)
    if existing_record && existing_record.id != id
      errors.add(:time_slot_id, "has already been assigned for this division and day")
    end
  end

  def teacher_availability
    return unless teacher_id && division_id && time_slot_id && day_id

    # Check if there is any other master timetable record with the same teacher, division, time slot, and day
    conflict = MasterTimetable.where(teacher_id: teacher_id, division_id: division_id, time_slot_id: time_slot_id, day_id: day_id).where.not(id: id).exists?

    errors.add(:base, "Teacher is already assigned to another division at the same time") if conflict
  end


  def validate_day
    if day_id == "Select_Day"
      errors.add(:day_id, "must be selected")
    end
  end

  def validate_time_slot
    if time_slot_id == "Select a Time Slot"
      errors.add(:time_slot_id, "must be selected")
    end
  end

  def validate_subject
    if subject_id == "Select Subject"
      errors.add(:subject_id, "must be selected")
    end
  end

  def validate_division
    if division_id == "Select Class"
      errors.add(:division_id, "must be selected")
    end
  end

  def validate_teacher
    if teacher_id == "Select Teacher"
      errors.add(:teacher_id, "must be selected")
    end
  end

  def render_master_timetable_pdf_layout(pdf)
    # Define the days of the week
    days_of_week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  
    # Fetch time slots from the TimeSlot model
    time_slots = TimeSlot.pluck(:start_time)
  
    # Define table data
    table_data = []
  
    # Add headers row
    headers_row = ['Timeslot', 'Division']
    days_of_week.each do |day|
      headers_row.concat(['', day]) # Add an empty cell and then the day name
    end
    table_data << headers_row
  
    # Add data rows for each time slot
    time_slots.each do |time_slot|
      data_row = [time_slot.strftime('%I:%M %p'), '']
      days_of_week.each do |day|
        master_timetable = Master_timetables.all
        if master_timetable
          division_name = master_timetable.division.division
          subjects = master_timetable.subjects
          data_row.concat([division_name, subjects])
        else
          data_row.concat(['', '']) # Add empty cells if no data for this time slot and day
        end
      end
      table_data << data_row
    end
  
    # Calculate the minimum width required for the table
    min_table_width = table_data.transpose.map { |column| column.map { |cell| pdf.width_of(cell.to_s, size: 12, style: :normal) }.max }.sum + 60
  
    # Set the table width to the maximum of the calculated minimum width and the requested width
    table_width = [min_table_width, pdf.bounds.width].max
  
    # Create a new table with table data
    pdf.table(table_data, cell_style: { padding: 5, border_width: 1, border_color: "000000", align: :center }, width: table_width) do
      cells.padding = 8
      columns(0).width = 80 # Adjust width for timeslot column
      (1..-1).step(2) { |i| columns(i).width = 120 } # Adjust width for day columns
    end
  end
  
  



end
