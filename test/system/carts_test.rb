require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  test 'must assign cart to new session' do
    visit root_path
    assert_selector 'a', text: Cart.last.id
  end
end
