class HomeController < ApplicationController
  def index
    @countries = ALL_COUNTRIES
  end
end
