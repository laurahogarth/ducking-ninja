class Agent::HomeController < ApplicationController
  before_filter :authenticate_agent!
  def index    
  end
end
