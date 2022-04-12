require "test_helper"

class SeatTest < ActiveSupport::TestCase
  test 'Seat not valid wihtout seat type' do
    subject = Seat.new
    assert subject.invalid?
    assert subject.errors[:seat_type].any?
  end

  test 'Seat not valid wihtout number' do
    subject = Seat.new seat_type: 'regular'
    assert subject.invalid?
    assert subject.errors[:number].any?
  end

  test 'Seat number must be positive' do
    subject = Seat.new seat_type: 'regular', number: -1
    assert subject.invalid?
    assert subject.errors[:number].any?
  end

  test "Seat number must not be bigger than room size" do
    subject = Seat.new seat_type: 'regular', number: 3, room: rooms(:cinemark_one)
    assert subject.invalid?
    assert subject.errors[:number].any?
    message = ["This room can't have more seats"]
    assert_equal message, subject.error[:number]
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
