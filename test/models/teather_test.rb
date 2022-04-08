require "test_helper"

class TeatherTest < ActiveSupport::TestCase
  test 'teather not valid wihtout attributes' do
    subject = Teather.new
    assert subject.invalid?
    assert subject.errors[:name].any?
    assert subject.errors[:address].any?
    assert subject.errors[:city].any?
  end
end
