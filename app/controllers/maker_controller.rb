class MakerController < ApplicationController
  before_action :authenticate_admin!

  def index
    @addstudents = Addstudent.all
    @divisions = Division.all
    @master_timetables = MasterTimetable.all
    @galleries = Gallery.all
    @notices = Notice.where(deleted_at: nil)
    @subjects = Subject.all
    @teachers = Teacher.all
    @events = Event.all
  end

  def select_division
    @divisions = Division.all
  end

  def display_timetable
    @division = Division.find(params[:division_id])
    @master_timetable = MasterTimetable.where(division_id: @division.id)
    @subjects = Subject.all
    @teachers = Teacher.all
  end
  

  def update_master_timetable
    master_timetable_params[:master_timetable].each do |entry|
      master_timetable = MasterTimetable.find_by(id: entry[:id].to_i)
      if master_timetable
        master_timetable.update(entry.except(:id))
      end
    end
  
    redirect_to display_timetable_path(division_id: params[:division_id])
  end
  
  

  private


      def master_timetable_params
        params.permit(master_timetable: [:id, :day_id, :time_slot_id, :subject_id, :teacher_id])
      end


  
  def your_method_name_here(entry_params)
    entry_params[:timetable_entries].each do |entry|
      subject_id = entry[:subject_id].to_i
      teacher_id = entry[:teacher_id].to_i

    end
  end
  
  
end
