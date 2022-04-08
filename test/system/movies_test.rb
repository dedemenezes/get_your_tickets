require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit '/movies'

    assert_selector 'h1', text: "Movies"
    save_screenshot
    assert_selector ".card-movie", count: Movie.count
  end

  test 'visiting the show' do
    visit "/movies/#{movies(:harry_potter).id}"

    save_screenshot
    assert_selector 'h1', text: movies(:harry_potter).title
    assert_selector '.exibithion-card', count: movies(:harry_potter).exibithions.map(&:room).map(&:teather).uniq.count
    assert_selector '.btn-buy-session', count: movies(:harry_potter).exibithions
  end
end
