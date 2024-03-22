class TimeSlot < ApplicationRecord
    def display_name
        "#{start_time.strftime('%I:%M %p')} - #{end_time.strftime('%I:%M %p')}"
      end
end
