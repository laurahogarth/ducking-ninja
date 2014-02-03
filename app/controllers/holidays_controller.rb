class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_traveller!


  # GET /holidays
  def index
    @holidays = Holiday.where(:traveller_id => current_traveller.id).includes(:country)
  end

  # GET /holidays/1
  def show
  end

  # GET /holidays/new
  def new
    @holiday = Holiday.new
  end

  # GET /holidays/1/edit
  def edit
  end

  # POST /holidays
  def create
    @holiday = Holiday.new(holiday_params.merge :traveller_id => current_traveller.id)

    if @holiday.save
      redirect_to @holiday, notice: 'Holiday was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /holidays/1
  def update
    if @holiday.update(holiday_params.merge :traveller_id => current_traveller.id)
      redirect_to @holiday, notice: 'Holiday was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /holidays/1
  def destroy
    raise StandardError unless @holiday.traveller_id == current_traveller.id

    @holiday.destroy
    redirect_to holidays_url, notice: 'Holiday was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holiday
      @holiday = Holiday.where(:id => params[:id], :traveller_id => current_traveller.id).first
    end

    # Only allow a trusted parameter "white list" through.
    def holiday_params
      params.require(:holiday).permit(:country_id, :region, :nights, :earliest_date, :latest_date, :budget, :ballpark, :adults, :children, :include_travel, :description)
    end
end
