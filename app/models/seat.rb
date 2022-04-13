class Seat < ApplicationRecord
  include Validators

  belongs_to :room
  has_many :line_items, dependent: :destroy
  validates :seat_type, presence: true, inclusion: { in: %w[premium regular], message: "%{value} is not valid" }
  validates :number, presence: true, numericality: { greater_than: 0 }, room_capacity: true

  # before_validation :ensure_room_has_space_for_new_seat

  def mark_as_occupied!
    self.update(available: false)
    self
  end

  # private

  # def ensure_room_has_space_for_new_seat
  #   return if self.room.capacity > self.room.seats.length

  #   errors.add(:capacity, "This room can't have more seats")
  # end
end
