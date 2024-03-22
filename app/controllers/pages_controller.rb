class PagesController < ApplicationController
  
  def home
  end

def index
  @events = Event.all
end

  def notices
    @notices = Notice.all
  end

  def notices_summary
    @notices = Notice.all
    @notices = filter_by_category(@notices, params[:category_id]) if params[:category_id].present?
    render 'notices_summary'
  end

  def notices_details
    @notice = Notice.find(params[:id])
    render 'notices_details'
  end

  def weekly_timetable
    @divisions = Division.all # Or whatever query you use to retrieve divisions
    
    if params[:division_id].present?
      @division_selected = true
      @selected_division = Division.find(params[:division_id])
      @master_timetable = MasterTimetable.where(division_id: params[:division_id])
    else
      @division_selected = false
      @master_timetable = MasterTimetable.all
    end
    
  end
  


  

  def events_summary
    @events = Event.all
    render 'events_summary'
  end

  def teachers_summary
    @teachers = Teacher.all
    render 'teachers_summary'
  end

  def teachers_details
    @teacher = Teacher.find(params[:id])
    render 'teachers_details'
  end
  

  def events_details
    @events = Event.find(params[:id])
    render 'events_details'
  end

  def gallery_summary
    @galleries = Gallery.all
    render 'gallery_summary'
  end


  
  def gallery_details
    @galleries = Gallery.find(params[:id])
    render 'gallery_details'
  end



  before_action :set_master_timetables, only: [:index, :time_table]

  def time_table
    order_by = params[:order] || 'day, time_slot'
    @master_timetables = @master_timetables.order(order_by)
  end


  def show
    @notice = Notice.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf { render_notice_pdf(@notice) }
    end
  end


  private

  def render_notice_pdf(notice)
    pdf = Prawn::Document.new
    pdf.text(notice.content)
    send_data pdf.render, filename: 'notice.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def set_master_timetables
    @master_timetables = MasterTimetable.includes(:day, :time_slot, :subject, :division, :teacher).all
  end

  def filter_by_category(notices, category_id)
    notices.joins(:category).where(categories: { id: category_id })
  end



  skip_before_action :verify_authenticity_token

  def sub_create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private
  

  def subscription_params
    params.require(:subscription).permit(:endpoint, :p256dh, :auth)
  end

end
