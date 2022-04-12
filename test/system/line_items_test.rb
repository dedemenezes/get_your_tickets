require "application_system_test_case"

class LineItemsTest < ApplicationSystemTestCase
  # test 'visit new from movie#show' do
  #   visit movie_path(movies(:hp))
  #   click_link("session_#{exibithions(:night_session).id}")

  #   assert_selector 'p', text: "Escolha seus assentos:"
  # end

  # test 'visiting the new' do
  #   visit new_line_item_path(session_id: exibithions(:night_session).id)

  #   # save_screenshot
  #   assert_selector 'p', text: "Escolha seus assentos:"
  #   assert_selector '.seats', count: 1
  #   assert_selector '.seat', count: 2
  # end

  test 'creating line_item' do
    assert_equal 3, LineItem.count

    visit new_line_item_path(session_id: exibithions(:night_session).id)
    check("line_item_seat_id_#{seats(:regular_available_seat_in_cinemark_one).id}")
    click_button("Create Line item")
    assert_equal 4, LineItem.count

    page.has_content?('Movies')
  end
end
