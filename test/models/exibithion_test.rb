require "test_helper"

class ExibithionTest < ActiveSupport::TestCase
  test 'Exibithion is not valid without start time' do
    subject = Exibithion.new
    assert subject.invalid?
    assert subject.errors[:start_time].any?
  end

  test "start time can't be in the past" do
    subject = Exibithion.new start_time: 24.hours.ago, room: rooms(:cinemark_one), movie: movies(:hp)
    assert subject.invalid?, "The session can't start in the past"
    assert_equal ["The session can't be in the past"], subject.errors[:start_time]
  end

  test '#teather_name must return teather for the exibithion' do
    subject = exibithions(:night_session)
    assert_equal teathers(:cinemark).name, subject.teather_name
  end

  test '#teather_address must return teather for the exibithion' do
    subject = exibithions(:night_session)
    assert_equal teathers(:cinemark).address, subject.teather_address
  end

  test '#available_seats return available seats' do
    subject = exibithions(:night_session)
    expected = subject.available_seats
    assert_equal 2, expected.size
    subject_full = exibithions(:full)
    expected_full = subject_full.available_seats
    assert_equal [], expected_full
  end
end
