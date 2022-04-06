class Movie < ApplicationRecord
  include Validators

  validates :title, :overview, presence: true
  validates :title, :poster_path, :backdrop_path, uniqueness: true
  validates :release_date, presence: true, allow_blank: true, older: true
  validates :poster_path, :backdrop_path, format: { with: /\.(jpg|gif|png)\z/i,
                                                    message: 'must be a URL for GIF, JPG or PNG image.' }
end
