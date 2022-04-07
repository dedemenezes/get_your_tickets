class Room < ApplicationRecord
  belongs_to :teather
  validates :capacity, presence: true, numericality: { less_than: 101 }
end
