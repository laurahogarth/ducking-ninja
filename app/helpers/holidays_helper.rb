module HolidaysHelper

  def holiday_pax_summary(holiday)
    pax = []
    pax << pluralize(holiday.adults, "adult") if holiday.adults > 0
    pax << pluralize(holiday.children, "child") if holiday.children > 0
    pax.join " and "
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
