module HolidaysHelper

  def budget_type(holiday)
    holiday.ballpark? ? "Ballpark" : "Maximum"
  end

  def holiday_summary(holiday)
    "a holiday for #{holiday.adults} adults and #{holiday.children} children to #{holiday.country.name} with a budget of £#{holiday.budget}"
  end

end
