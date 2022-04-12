class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :exibithion
  belongs_to :room
  belongs_to :seat

  validates :seat, uniqueness: { scope: :exibithion, message: "Seat is not available" }
end
