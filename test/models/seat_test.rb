require "test_helper"

class SeatTest < ActiveSupport::TestCase
  test 'Seat not valid wihtout seat type' do
    subject = Seat.new
    assert subject.invalid?
    assert subject.errors[:seat_type].any?
  end

  test 'seat availability must be false by default' do
    assert_equal false, Seat.new.available
  end

  def new_seat(seat_type)
    Seat.new(seat_type: seat_type, room: rooms(:cinemark_one), available: false)
  end

  test "Seat type must be premium or regular" do
    ok_seats = %w[premium regular]
    ok_seats.each do |seat_type|
      seat = new_seat(seat_type)
      assert seat.valid?, "#{seat_type} shouldn't be invalid"
    end
    seat = new_seat("VIP")
    assert seat.invalid?, "#{seat.seat_type} shouldn't be valid"
  end
end
