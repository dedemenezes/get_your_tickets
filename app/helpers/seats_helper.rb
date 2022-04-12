module SeatsHelper
  def self.seats_types(seats)
    seats.order(:id)
  end
end
