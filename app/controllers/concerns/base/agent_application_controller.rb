class AgentApplicationController < ApplicationController
  before_filter :authenticate_agent!
end
