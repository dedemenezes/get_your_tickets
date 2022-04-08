module Validators
  class OlderValidator < ActiveModel::EachValidator
    FIRST_MOVIE_DATE = Date.new(1888, 1, 1)

    def validate_each(record, attribute, value)
      value = '' if value.nil?
      if value < FIRST_MOVIE_DATE
        record.errors.add attribute, (options[:message] || "Can't be older than 'Roundhay Garden Scene'")
      end
    end
  end
end
