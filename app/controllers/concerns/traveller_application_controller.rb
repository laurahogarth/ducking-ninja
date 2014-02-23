class TravellerApplicationController < ApplicationController
  before_filter :authenticate_traveller!
end
