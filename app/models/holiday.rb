class Holiday < ActiveRecord::Base

  #VALIDATIONS
  validates_presence_of :country_id, :traveller_id, :earliest_date, :latest_date  
  validates_numericality_of :adults, :children, :greater_than_or_equal_to => 0
  validates_numericality_of :nights, :budget, :greater_than => 0

  validate :has_at_least_one_pax 
  validate :has_valid_dates

  #ASSOCIATIONS
  belongs_to :country
  belongs_to :traveller
  has_many :pitches

  def budget_type
    ballpark? ? "Ballpark" : "Maximum"
  end

  def summary
    "a holiday for #{adults} adults and #{children} children to #{country.name} with a budget of £#{budget}"
  end

  private
  def has_at_least_one_pax
    return unless adults and children

    if((adults + children) == 0)
      errors.add(:passengers, "must add up to more than zero")
    end
  end

  def has_valid_dates
    return unless earliest_date and latest_date and nights

    [:earliest_date, :latest_date].each do |date_type|
      errors.add date_type, "can not be in the past" if(self.send(date_type).past?)
    end

    if(latest_date - earliest_date < nights)
      errors.add(:nights, "must not exceed earliest/latest date range")
    end
    if(latest_date < earliest_date)
      errors.add(:latest_date, "must be after earliest date")
    end
  end
end
