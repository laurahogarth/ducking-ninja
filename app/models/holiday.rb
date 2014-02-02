class Holiday < ActiveRecord::Base

  #VALIDATIONS
  validates_presence_of :country_id, :nights, :earliest_date, :latest_date, :budget, :ballpark?
  validates_numericality_of :adults, :children, :greater_than_or_equal_to => 0
  validates_numericality_of :nights, :greater_than => 0

  validate :has_at_least_one_pax 
  validate :has_valid_dates

  #ASSOCIATIONS
  belongs_to :country
  belongs_to :traveller

  def budget_type
    ballpark? ? "Ballpark" : "Maximum"
  end

  private
  def has_at_least_one_pax
    if((adults + children) == 0)
      errors.add(:passengers, "must add up to more than zero")
    end
  end

  def has_valid_dates
    if(end_date - start_date < nights)
      errors.add(:nights, "must not exceed earliest/latest date range")
    end

    if(end_date > start_date)
      errors.add(:end_date, "must be after start date")
  end
end
