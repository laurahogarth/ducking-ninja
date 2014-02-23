class Traveller::HolidaysController < TravellerApplicationController

  load_and_authorize_resource
  skip_load_resource :only => :create

  # GET /holidays
  def index
    @holidays = current_traveller.holidays.includes(:country, :pitches => {:agent => :agent_detail}).page params[:page]
  end

  # GET /holidays/1
  def show
    @pitches = @holiday.pitches.page params[:page]
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
    @holiday = current_traveller.holidays.build holiday_params

    if @holiday.save
      redirect_to @holiday, notice: 'Holiday was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /holidays/1
  def update
    if @holiday.update holiday_params
      redirect_to @holiday, notice: 'Holiday was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /holidays/1
  def destroy
    @holiday.destroy
    redirect_to holidays_url, notice: 'Holiday was successfully destroyed.'
  end


  private
  # Only allow a trusted parameter "white list" through.
  def holiday_params
    params.require(:holiday).permit(:country_id, :region, :nights, :earliest_date, :latest_date, :budget, :ballpark, :adults, :children, :include_travel, :description)
  end
end
