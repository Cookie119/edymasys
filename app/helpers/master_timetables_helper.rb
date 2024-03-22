module MasterTimetablesHelper
    def format_time(time_or_string)
      return 'Unknown' if time_or_string.nil?
  
      if time_or_string.is_a?(Time)
        time_or_string.strftime('%I:%M %p')
      else
        # Assuming the string is in 'HH:MM:SS' format
        Time.parse(time_or_string).strftime('%I:%M %p')
      end
    end
  end
  