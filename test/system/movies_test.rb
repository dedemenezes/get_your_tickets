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

    assert_selector 'h1', text: movies(:harry_potter).title
  end
end
