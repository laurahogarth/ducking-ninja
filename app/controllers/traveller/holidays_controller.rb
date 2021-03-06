class Traveller::HolidaysController < TravellerApplicationController
  load_and_authorize_resource

  # GET /holidays
  def index
    @holidays = @holidays.includes(:country, :pitches => :agent ).page params[:page]
    @holidays_with_unseen_pitches = Pitch.unseen.where(:holiday_id => @holidays.ids.uniq).map(&:holiday_id) 
    decorate! :@holidays
  end

  # GET /holidays/1
  def show
    @pitches = @holiday.pitches.includes(:agent => :agent_detail).page params[:page]
    decorate! :@holiday
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
    if @holiday.update(holiday_params(:skip_country => true))
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

  # PATCH /holidays/1/toggle_open
  def toggle_open
    @holiday.toggle! :open    
    redirect_to @holiday, notice: "Holiday is now #{@holiday.open? ? 'open' : 'closed'}" 
  end


  private
  # Only allow a trusted parameter "white list" through.
  def holiday_params(opts = {})
    #Do not allow users to change country after initial creation...
    params[:holiday].delete(:country_id) if opts[:skip_country]

    params.require(:holiday).permit(:country_id, :region, :nights, :earliest_date, :latest_date, :budget, :adults, :children, :include_travel, :description)
  end
end
