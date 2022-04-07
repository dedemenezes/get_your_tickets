require "test_helper"

class RoomTest < ActiveSupport::TestCase
  test 'Room not valid wihtout capacity' do
    subject = Room.new
    assert subject.invalid?
    assert subject.errors[:capacity].any?
  end

  test "Room capacity must not be bigger than 100" do
    subject = rooms(:too_big)
    assert subject.invalid?
    assert subject.errors[:capacity].any?
  end
end
