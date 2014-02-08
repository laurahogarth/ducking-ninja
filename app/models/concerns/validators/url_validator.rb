class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return true if value.blank?

    record.errors.add attribute, (options[:message] || "is not a valid URL (remember to add http://)") unless
    value =~ /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/
  end
end

