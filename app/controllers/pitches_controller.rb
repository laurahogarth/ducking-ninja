class PitchesController < ApplicationController
  load_and_authorize_resource

  def index
    @pitches = current_traveller.pitches
  end

  def show
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
