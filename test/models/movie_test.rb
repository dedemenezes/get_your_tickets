require "test_helper"

class MovieTest < ActiveSupport::TestCase
  test 'movie title and overview must not be empty' do
    movie = Movie.new
    assert movie.invalid?
    assert movie.errors[:title].any?
    assert movie.errors[:overview].any?
  end

  test "movie must not be older than 'Roundhay Garden Scene'" do
    movie = Movie.new(title: "aaa",
                      overview: "very nice movie",
                      release_date: Date.new(1887, 1, 1))
    assert movie.invalid?
    assert_equal ["Can't be older than 'Roundhay Garden Scene'"], movie.errors[:release_date]
  end

  def new_movie(image_path)
    Movie.new(title: 'Harry',
              overview: 'Potter',
              release_date: Date.today,
              backdrop_path: image_path,
              poster_path: image_path)
  end

  test "movie images must be JPG, PNG or GIF" do
    ok = %w[fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif]
    bad = %w[fred.doc fred.gif/more fred.gif.more]

    ok.each do |image_url|
      assert new_movie(image_url).valid?, "#{image_url} shouldn't be invalid"
    end

    bad.each do |image_url|
      subject = new_movie(image_url)
      message = ['must be a URL for GIF, JPG or PNG image.']
      assert subject.invalid?, "#{image_url} shouldn't be valid"
      assert_equal message, subject.errors[:poster_path]
      assert_equal message, subject.errors[:backdrop_path]
    end
  end
end
