require "test_helper"

class RoomTest < ActiveSupport::TestCase
  test 'Room not valid wihtout capacity' do
    subject = Room.new
    assert subject.invalid?
    assert subject.errors[:capacity].any?
  end

  test "Room capacity must not be bigger than 100" do
    subject = Room.new(capacity: 101, teather: teathers(:cinemark))
    assert subject.invalid?
    assert subject.errors[:capacity].any?
  end

  test "#exibithions_for must return all exibithions for an specific movie" do
    subject = rooms(:cinemark_one)
    movie = movies(:harry_potter)
    assert_kind_of ActiveRecord::AssociationRelation, subject.exibithions_for(movie), 'must be a collection'
    assert_equal 2, subject.exibithions_for(movie).count
  end
end
