require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  test 'must assign cart to new session' do
    visit root_path
    assert_selector 'a', text: Cart.last.id
  end

  test 'visiting cart show' do
    cart = carts(:two_line_items)
    line_items
    visit cart_path(cart)
    assert_selector '.line-item', count: 2
  end
end
