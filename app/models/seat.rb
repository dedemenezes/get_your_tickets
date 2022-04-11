class Seat < ApplicationRecord
  belongs_to :room
  has_many :line_items
  validates :seat_type, presence: true, inclusion: { in: %w(premium regular), message: "%{value} is not valid" }
end
