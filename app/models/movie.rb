class OlderValidator < ActiveModel::EachValidator
  FIRST_MOVIE_DATE = Date.new(1888, 1, 1)

  def validate_each(record, attribute, value)
    value = '' if value.nil?
    if value < FIRST_MOVIE_DATE
      record.errors.add attribute, (options[:message] || "Can't be older than 'Roundhay Garden Scene'")
    end
  end
end

class Movie < ApplicationRecord
  include ActiveModel::Validations

  validates :title, :overview, presence: true
  validates :release_date, presence: true, allow_blank: true, older: true
  validates :poster_path, :backdrop_path, format: { with: /\.(jpg|gif|png)\z/i,
                                                    message: 'must be a URL for GIF, JPG or PNG image.' }
end
