class Room < ApplicationRecord
  belongs_to :teather
  has_many :seats, dependent: :destroy
  has_many :exibithions
  validates :capacity, presence: true, numericality: { less_than: 101 }
end
