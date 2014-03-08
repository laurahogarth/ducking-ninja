class Agent::PitchesController < AgentApplicationController
  include Features::SortableTable

  load_and_authorize_resource 
  before_action :set_holiday, :only => [:edit, :show, :update, :new, :create, :destroy]
  
  # GET agent/pitches
  def index
    @pitches = current_agent.pitches.includes(:holiday => :country).order(sort_conditions).page params[:page]
  end

  # GET agent/holidays/1/pitches/1
  def show
  end

  # GET agent/holidays/1/pitches/new
  def new
    @pitch = @holiday.pitches.build
  end

  # GET agent/holidays/1/pitches/1/edit
  def edit
  end

  # POST agent/holidays/1/pitches
  def create
    @pitch = @holiday.pitches.build(pitch_params.merge(:agent_id => current_agent.id))
    if @pitch.save
      redirect_to [:agent, @holiday], notice: 'Pitch was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT agent/holidays/1/pitches/1
  def update
    if @pitch.update(pitch_params)
      redirect_to [:agent, @holiday], notice: 'Pitch was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE agent/holidays/1/pitches/1
  def destroy
    @pitch.destroy
    redirect_to [:agent, @holiday], notice: 'Pitch was successfully destroyed.'
  end

  # GET agent/holidays/1/pitch
  def pitch
  end

  def find_by_ref
    pitch = current_agent.pitches.where(:ref => params[:ref].upcase).first
    if pitch
      redirect_to [:agent, pitch.holiday, pitch]
    else
      redirect_to request.referrer, notice: "Could not find pitch with that reference"
    end
  end


  private
    def set_holiday
      @holiday = Holiday.find(params[:holiday_id])
    end

    # Only allow a trusted parameter "white list" through.
    def pitch_params
      params.require(:pitch).permit(:min, :max, :content, :expertise)
    end
    
end
