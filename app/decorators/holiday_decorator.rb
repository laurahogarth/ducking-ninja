class HolidayDecorator < Draper::Decorator
  delegate_all

  def pax_summary
    pax = []
    pax << h.pluralize(model.adults, "adult") if model.adults > 0
    pax << h.pluralize(model.children, "child") if model.children > 0
    pax.join " and "
  end

  def date_summary
    "Between #{h.nice_date model.earliest_date} and #{h.nice_date model.latest_date}"
  end

  def duration_summary
    h.pluralize(model.nights, "night")
  end

  def budget_summary
    h.raw "&pound;#{model.budget}"
  end

end
