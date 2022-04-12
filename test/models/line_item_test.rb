require "test_helper"

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'seat must be available' do
    subject = LineItem.new(
      cart: carts(:two_line_items),
      room: rooms(:cinemark_one),
      seat: seats(:regular_available_seat_in_cinemark_one),
      exibithion: exibithions(:night_session)
    )
    assert subject.invalid?, "Seat is not available"
    assert_equal ["Seat is not available"], subject.errors[:seat]
  end
end
