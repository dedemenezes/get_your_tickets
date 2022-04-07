class Room < ApplicationRecord
  belongs_to :teather
  has_many :seats, dependent: :destroy
  validates :capacity, presence: true, numericality: { less_than: 101 }
end
