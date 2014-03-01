module HtmlHelper


  def placekitten(width, height)
    image_tag "http://placekitten.com/g/#{width}/#{height}"
  end

  def nice_boolean(bool)
    if bool
      content_tag :span, "Yes", :class => [:success, :label]
    else
      content_tag :span, "No", :class => [:alert, :label]
    end
  end

  def self.to_holiday_count_js(data)
    final_array = [["Country", "Holidays"]]
    data.each do |country|
      final_array << [country.name, country.holidays.size]
    end
    return final_array 
  end

end
