class AgentsController < ApplicationController

  load_and_authorize_resource 
  before_filter :authenticate_agent!

  def dashboard    
  end

end
