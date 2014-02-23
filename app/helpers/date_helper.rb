module DateHelper

  def nice_date(date)
    date.to_formatted_s(:short)
  end

end
