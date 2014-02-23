module HtmlHelper

  def nice_boolean(bool)
    if bool
      content_tag :span, "Yes", :class => [:success, :label]
    else
      content_tag :span, "No", :class => [:alert, :label]
    end
  end

end
