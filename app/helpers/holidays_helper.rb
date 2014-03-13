module HolidaysHelper

  def budget_type(holiday)
    holiday.ballpark? ? "Ballpark" : "Maximum"
  end

  def holiday_summary(holiday)
    "#{holiday.nights} night holiday for #{pluralize(holiday.adults, "adult")} and #{pluralize(holiday.children, "child")} to #{holiday.country.name} with a budget of £#{holiday.budget} (#{budget_type(holiday)})"
  end

end
