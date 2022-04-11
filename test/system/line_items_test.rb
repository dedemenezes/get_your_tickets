require "application_system_test_case"

class LineItemsTest < ApplicationSystemTestCase
  test 'visit new from movie#show' do
    visit movie_path(movies(:hp))
    click_link("session_#{exibithions(:night_session).id}")
    assert_selector 'p', text: "Escolha seus assentos:"
  end

  test 'visiting the new' do
    visit new_line_item_path

    assert_selector 'p', text: "Escolha seus assentos:"
    assert_selector '.seats', count: 1
  end
end
