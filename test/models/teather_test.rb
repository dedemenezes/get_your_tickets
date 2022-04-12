require "test_helper"

class TeatherTest < ActiveSupport::TestCase
  test 'teather not valid wihtout attributes' do
    subject = Teather.new
    assert subject.invalid?
    assert subject.errors[:name].any?
    assert subject.errors[:address].any?
    assert subject.errors[:city].any?
  end

  test '#rooms_playing must return rooms playing specific movie' do
    teather = teathers(:cinemark)
    movie = movies(:hp)
    assert_equal 3, teather.rooms_playing(movie).count
  end
end
