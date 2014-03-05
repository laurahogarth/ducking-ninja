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

  def sortable_column(title, column_name = nil)
    column_name ||= title.parameterize.underscore.to_sym

    if params[:sort_column]
      sort_column = params[:sort_column].to_sym
      css_class = params[:sort_order] if column_name == sort_column
    end

    sort_order = params[:sort_order] == "asc" ? "desc" : "asc"
    link_to title, { :sort_order => sort_order, :sort_column => column_name }, { :class => css_class }
  end

end
