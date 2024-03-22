class MasterTimetablesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_master_timetable, except: [:render_master_timetable_pdf]
  before_action :set_master_timetable, only: %i[ show edit update destroy ]

  # GET /master_timetables or /master_timetables.json
  def index
    @master_timetables = MasterTimetable.all
  end

  # GET /master_timetables/1 or /master_timetables/1.json
  def show
    if params[:id] == "render_master_timetable_pdf"
      render_master_timetable_pdf
    else
      @master_timetable = MasterTimetable.find(params[:id])
    end
  end

  # GET /master_timetables/new
  def new
    @master_timetable = MasterTimetable.new
    @time_slots = TimeSlot.all # Or fetch the time slots based on your requirements
    
  end

 
  

  # GET /master_timetables/1/edit
  def edit
    @time_slots = TimeSlot.all
    @master_timetable = MasterTimetable.find(params[:id])
  end

  # POST /master_timetables or /master_timetables.json
  def create
    @master_timetable = MasterTimetable.new(master_timetable_params)
    @time_slots = TimeSlot.all
    
    respond_to do |format|
      if @master_timetable.save
        format.html { redirect_to @master_timetable, notice: 'Master timetable was successfully created.' }
        format.json { render :show, status: :created, location: @master_timetable }
      else
        format.html { render :new }
        format.json { render json: @master_timetable.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /master_timetables/1 or /master_timetables/1.json
  def update
    respond_to do |format|
      if @master_timetable.update(master_timetable_params)
        format.html { redirect_to master_timetable_url(@master_timetable), notice: "Master timetable was successfully updated." }
        format.json { render :show, status: :ok, location: @master_timetable }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master_timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_timetables/1 or /master_timetables/1.json
  def destroy
    @master_timetable.destroy!

    respond_to do |format|
      format.html { redirect_to master_timetables_url, notice: "Master timetable was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  
  private
  

  def set_master_timetable
  
  
    @master_timetable = MasterTimetable.find(params[:id])
  end
  

    # Only allow a list of trusted parameters through.
    def master_timetable_params
      params.require(:master_timetable).permit(:day_id, :time_slot_id, :subject_id, :division_id, :teacher_id)
    end
  end
