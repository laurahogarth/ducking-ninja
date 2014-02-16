class PitchesController < ApplicationController
  load_and_authorize_resource

  def index
    @pitches = current_traveller.pitches
  end

  def show
  end

end
