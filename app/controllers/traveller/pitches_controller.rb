class Traveller::PitchesController < ApplicationController
  load_and_authorize_resource

  def show
    @pitch.seen!
    @agent_detail = @pitch.agent.agent_detail
  end

  def update_status
    @pitch.update_status! pitch_params[:status]
    redirect_to [@pitch.holiday], notice: "Status was updated"
  end

  # Only allow a trusted parameter "white list" through.
  def pitch_params
    params.require(:pitch).permit(:status)
  end

end
