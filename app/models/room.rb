class Room < ApplicationRecord
  belongs_to :teather
  has_many :seats, dependent: :destroy
  has_many :exibithions, dependent: :destroy
  has_many :line_items
  validates :capacity, presence: true, numericality: { less_than: 101 }

  def exibithions_for(movie)
    exibithions.where(movie: movie)
  end
end
