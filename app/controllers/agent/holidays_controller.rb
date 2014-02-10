
class Agent::HolidaysController < ApplicationController

  load_and_authorize_resource
  before_filter :authenticate_agent!

  # GET agent/holidays
  def index
    @holidays = Holiday.all.includes :country
  end

  # GET agent/holidays/1
  def show
  end

end
