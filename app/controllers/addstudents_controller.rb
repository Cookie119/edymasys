class AddstudentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_addstudent, only: %i[ show edit update destroy ]
  before_action :set_addstudent, except: [:download_pdf]

  # GET /addstudents or /addstudents.json
  def index
    @addstudents = Addstudent.all
  end

  # GET /addstudents/1 or /addstudents/1.json
  def show
    if params[:id] == "download_pdf"
      download_pdf
    else
      @addstudent = Addstudent.find(params[:id])
    end
  end

  # GET /addstudents/new
  def new
    @addstudent = Addstudent.new
  end

  # GET /addstudents/1/edit
  def edit
    @addstudent = Addstudent.find(params[:id])
  end

  # POST /addstudents or /addstudents.json
  def create
    @addstudent = Addstudent.new(addstudent_params)

    respond_to do |format|
      if @addstudent.save
        format.html { redirect_to addstudent_url(@addstudent), notice: "Addstudent was successfully created." }
        format.json { render :show, status: :created, location: @addstudent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @addstudent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addstudents/1 or /addstudents/1.json
  def update
    respond_to do |format|
      if @addstudent.update(addstudent_params)
        format.html { redirect_to addstudents_url, notice: "Addstudent was successfully updated." }
        format.json { render :show, status: :ok, location: @addstudent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @addstudent.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def destroy
    @addstudent = Addstudent.find(params[:id])
    @addstudent.destroy
  
    respond_to do |format|
      format.html { redirect_to addstudents_url, notice: "Addstudent was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

  def download_pdf
    @students = Addstudent.all 
  
    respond_to do |format|
      format.pdf do
        pdf = Prawn::Document.new
        # Add student data to the PDF document
        @students.each do |addstudent|
          pdf.text "#{addstudent.first_name} #{addstudent.middle_name} #{addstudent.surname}"
          pdf.text "Date of Birth: #{addstudent.date_of_birth}"
          pdf.text "Gender: #{addstudent.gender}"
          pdf.text "Phone Number: #{addstudent.phone_number}"
          pdf.text "Email: #{addstudent.email}"
          pdf.text "Address: #{addstudent.address}"
          pdf.move_down 20
        end
        send_data pdf.render, filename: "students_data.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  private


  def set_addstudent
    return unless params[:id] != "download_pdf"
  
    @addstudent = Addstudent.all
  end

    # Only allow a list of trusted parameters through.
    def addstudent_params
      params.require(:addstudent).permit(:photograph, :first_name, :middle_name, :surname, :date_of_birth, :gender, :phone_number, :email, :address, :fathers_name, :mothers_name, :parents_phone_number, :job_placement, :marital_status, :enrollment_number)
    end
end
