class PostcodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return true if value.blank?

    record.errors.add attribute, (options[:message] || "is not a valid postcode") unless
    value =~ /^[a-zA-Z]{1,2}[0-9][0-9A-Za-z]{0,1} {0,1}[0-9][A-Za-z]{2}$/
  end
end

