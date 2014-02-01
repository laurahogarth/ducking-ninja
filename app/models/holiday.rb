class Holiday < ActiveRecord::Base

  #VALIDATIONS
  validates_presence_of :country_id, :nights, :earliest_date, :latest_date, :budget, :ballpark?
  validates_numericality_of :adults, :children, :greater_than_or_equal_to => 0
  validates_numericality_of :nights, :greater_than => 0

  validate :has_at_least_one_pax 

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
end
