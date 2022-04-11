class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :exibithion
  belongs_to :room
  belongs_to :seat
end
