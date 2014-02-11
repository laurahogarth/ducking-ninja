class Agent::PitchesController < ApplicationController

  load_and_authorize_resource
  skip_load_resource :only => :create
  before_filter :authenticate_agent!
  #before_action :set_pitch, only: [:show, :edit, :update, :destroy]
  before_action :set_holiday, :only => [:show, :edit, :update, :new, :create, :destroy]

  
  # GET /pitches
  def index
    @pitches = current_agent.pitches
  end

  # GET /pitches/1
  def show
  end

  # GET /pitches/new
  def new
    @pitch = @holiday.pitches.build
  end

  # GET /pitches/1/edit
  def edit
  end

  # POST /pitches
  def create
    @pitch = @holiday.pitches.build(pitch_params.merge(:agent_id => current_agent.id))

    if @pitch.save
      redirect_to [:agent, @holiday, @pitch], notice: 'Pitch was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /pitches/1
  def update
    if @pitch.update(pitch_params)
      redirect_to [:agent, @holiday, @pitch], notice: 'Pitch was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /pitches/1
  def destroy
    @pitch.destroy
    redirect_to agent_pitches_url, notice: 'Pitch was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_pitch
    #  @pitch = Pitch.find(params[:id])
    #end

    def set_holiday
      @holiday = Holiday.find(params[:holiday_id])
    end

    # Only allow a trusted parameter "white list" through.
    def pitch_params
      params.require(:pitch).permit(:min, :max, :expertise, :content)
    end
end
