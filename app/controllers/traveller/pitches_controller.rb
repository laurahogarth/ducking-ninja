class Traveller::PitchesController < ApplicationController
  load_and_authorize_resource

  def show
    unless @pitch.seen?
      @pitch.seen = true
      @pitch.save
    end
    
    @agent_detail = @pitch.agent.agent_detail
  end

  def update_status
    @pitch.status = pitch_params[:status]
    @pitch.save
    redirect_to [@pitch.holiday, @pitch], notice: "Status was updated"
  end

  # Only allow a trusted parameter "white list" through.
  def pitch_params
    params.require(:pitch).permit(:status)
  end

end
