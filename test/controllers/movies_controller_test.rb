class MoviessControllerTest < ActionDispatch::IntegrationTest
  test "should show movie" do
    movie = movies(:harry_potter)
    get movie_url(movie)
    assert_response :success
  end
end
