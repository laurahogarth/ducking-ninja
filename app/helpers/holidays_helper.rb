module HolidaysHelper

  def budget_type(holiday)
    holiday.ballpark? ? "Ballpark" : "Maximum"
  end

  def holiday_summary(holiday)
    "#{holiday.nights} night holiday for #{pluralize(holiday.adults, "adult")} and #{pluralize(holiday.children, "child")} to #{holiday.country.name} with a budget of £#{holiday.budget} (#{budget_type(holiday)})"
  end

  def holiday_pax_summary(holiday)
    "#{pluralize(holiday.adults, "adult")} and #{pluralize(holiday.children, "child")}"
  end

  def holiday_date_summary(holiday)
    "Between #{nice_date holiday.earliest_date} and #{nice_date holiday.latest_date}"
  end

  def holiday_duration_summary(holiday)
    pluralize(holiday.nights, "night")
  end

  def holiday_budget_summary(holiday)
    raw "&pound;#{holiday.budget}"
  end

end
