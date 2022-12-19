class HttpUrlValidator < ActiveModel::EachValidator
  require 'uri'

  def self.compliant?(value)
    uri = URI.parse(value)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def validate_each(record, attribute, value)
    return unless value.present?

    record.errors.add(attribute, 'is not a valid link') unless self.class.compliant?(value)
  end
end
