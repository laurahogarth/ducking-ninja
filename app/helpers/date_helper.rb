module DateHelper

  def nice_date(date)
    date.to_formatted_s(:rfc822)
  end

end
