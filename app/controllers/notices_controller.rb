class NoticesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_notice, only: %i[ show edit update destroy ]

  def index
    @notices = Notice.where(deleted_at: nil)
  end
  
  def show

    @notice = Notice.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf { render_notice_pdf(@notice) }
    end
  end

  def display
    @notice = Notice.find(params[:id])
  end

  def new
    @notice = Notice.new
  end

  def edit
  end

  def create
    @notice = Notice.new(notice_params)
    
    # Assign the category_id directly
    @notice.category_id = params[:notice][:category_id]

    respond_to do |format|
      if @notice.save
        format.html { redirect_to notice_url(@notice), notice: "Notice was successfully created." }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to notice_url(@notice), notice: "Notice was successfully updated." }
        format.json { render :show, status: :ok, location: @notice }
        format.pdf { render_notice_pdf(@notice) } # Add this line
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @notice = Notice.find(params[:id])
    puts "Before destroy: #{Notice.count}"
    @notice.destroy
    puts "After destroy: #{Notice.count}"
    respond_to do |format|
      format.html { redirect_to notices_url, notice: 'Notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

def destroy_confirmation
  @notice = Notice.find(params[:id])
  flash.now[:notice] = 'Destroy Confirmation'
  render :show
end


  # def download_all_notices
  #   @notices = Notice.all
  
  #   respond_to do |format|
  #     format.pdf do
  #       pdf = Prawn::Document.new
  #       @notices.each do |notice|
  #         pdf.text("Title: #{notice.title}")
  #         pdf.text("Content: #{notice.content}")
  #         pdf.image notice.image.download, width: 200 if notice.image.attached?
  #         pdf.text("\n")
  #       end
  #       send_data pdf.render, filename: 'notices.pdf', type: 'application/pdf', disposition: 'inline'
  #     end
  #   end
  # end

  private

 def set_notice
    @notice = Notice.find(params[:id])
  end

  def render_notice_pdf(notice)
    font_path = Rails.root.join('app', 'assets', 'fonts', 'Arial-Unicode-Regular.ttf')
    pdf = Prawn::Document.new

    pdf.font_families["Arial-Unicode-Regular"] = {
  normal: { file: font_path }
}
   # Define the font and size for the notice
   pdf.font("Arial-Unicode-Regular")
pdf.font_size(12)

# School Name
pdf.text_box("LOKVISHWAS PRATISHTHAN", align: :center, size: 20 , at: [0, pdf.bounds.height], width: pdf.bounds.width)
pdf.move_down(25)
pdf.text("9XQW+R9C, Yashwant Nagar, Queula", align: :center,size: 10 )
pdf.move_down(5)
pdf.text(" Ponda, Goa 403401", align: :center,size: 10 )

pdf.stroke_horizontal_line(-40, pdf.cursor - 10, :at => pdf.cursor - 10, :width => pdf.bounds.width)

# Title
pdf.move_down(60)
pdf.text("NOTICE", align: :center, size: 20 )


line_start = pdf.bounds.width / 2 - 80
line_end = pdf.bounds.width / 2 + 80 
pdf.stroke_horizontal_line(line_start, line_end, at: pdf.cursor)

# Date
pdf.text_box("Date: #{notice.created_at.strftime('%Y-%m-%d')}",
             at: [pdf.bounds.width - 100, pdf.bounds.height - 90],
             width: pdf.bounds.width)


# Subject
pdf.move_down(30)
pdf.text("Subject: #{notice.title}", size: 12)



# Content
pdf.move_down(30)
pdf.text(notice.content)

# For Staff Only
pdf.move_cursor_to(80)
pdf.text("For #{notice.category.name}", align: :right)


# Save or render the PDF

    if notice.image.attached?
      image_data = notice.image.download
      pdf.image StringIO.new(image_data), width: 200
    end
  
    send_data pdf.render, filename: "#{notice.title}.pdf", type: "application/pdf", disposition: "inline"

  end
  
  def notice_params
    params.require(:notice).permit(:title, :content, :category_id) # Ensure category_id is permitted
  end
end
