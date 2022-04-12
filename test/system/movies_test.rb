require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url

    assert_selector 'h1', text: "Movies"
    assert_selector ".card-movie", count: Movie.count
  end

  def movie_subject
    movies(:hp)
  end

  test 'visiting the show' do
    visit "/movies/#{movie_subject.id}"

    assert_selector 'h1', text: movie_subject.title
    assert_selector '.exibithion-card', count: 1
    assert_selector '.btn-buy-session', count: 2
    assert_selector '.session-calendar', count: 1
  end

  test 'filtering exibithions using calendar' do
    visit movie_path(movie_subject)
    assert_selector '.exibithion-card', count: 1

    click_link(Date.today.strftime('%^a'))
    assert_selector '.exibithion-card', count: 0
    
    click_link(Date.tomorrow.strftime('%^a'))
    assert_selector '.exibithion-card', count: 1
  end

end
