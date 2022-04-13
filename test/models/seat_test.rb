require "test_helper"

class SeatTest < ActiveSupport::TestCase
  test 'Seat not valid wihtout seat type' do
    subject = Seat.new room: rooms(:cinemark_two), number: 3
    assert subject.invalid?
    assert subject.errors[:seat_type].any?
  end

  test 'Seat not valid wihtout number' do
    subject = Seat.new seat_type: 'regular', room: rooms(:cinemark_two)
    assert subject.invalid?
    assert subject.errors[:number].any?
  end

  test 'Seat number must be positive' do
    subject = Seat.new seat_type: 'regular', number: -1, room: rooms(:cinemark_two)
    assert subject.invalid?
    assert subject.errors[:number].any?
  end

  test "Seat number must not be bigger than room size" do
    subject = Seat.new seat_type: 'regular', number: 3, room: rooms(:cinemark_one)

    assert subject.invalid?
    assert subject.errors[:number].any?
    message = ["This room can't have more seats"]
    assert_equal message, subject.errors[:number]
  end

  test 'seat availability must be false by default' do
    assert_equal false, Seat.new.available
  end

  def new_seat(seat_type)
    Seat.new(number: 3, seat_type: seat_type, room: rooms(:cinemark_two))
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

  test '#mark_as_occupied! make seat not available' do
    subject = seats(:regular_available_seat_in_cinemark_one)
    assert subject.available
    subject.mark_as_occupied!
    assert_not subject.available
  end
end
