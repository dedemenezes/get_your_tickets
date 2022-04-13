require "test_helper"

class RoomTest < ActiveSupport::TestCase
  test 'Room not valid wihtout capacity' do
    subject = Room.new teather: teathers(:cinemark), number: 3
    assert subject.invalid?
    assert subject.errors[:capacity].any?
  end

  test "Room capacity must not be bigger than 100" do
    subject = Room.new(capacity: 101, teather: teathers(:cinemark), number: 3)
    assert subject.invalid?

    assert subject.errors[:capacity].any?
  end

  test "#exibithions_for must return all exibithions for an specific movie" do
    subject = rooms(:cinemark_one)
    movie = movies(:hp)
    assert_kind_of ActiveRecord::AssociationRelation, subject.exibithions_for(movie), 'must be a collection'
    assert_equal 2, subject.exibithions_for(movie).count
  end

  test '#exibithions_for return exibithions ordered by time' do
    subject = rooms(:cinemark_one)
    expected = [exibithions(:night_session), exibithions(:after_tomorrow_session)]
    assert_equal 2, subject.exibithions.size

    exibithions_for_movie = subject.exibithions_for(movies(:hp))
    assert_equal expected, exibithions_for_movie

    reversed = exibithions_for_movie.reverse
    assert_not_equal reversed, exibithions_for_movie
  end
end
