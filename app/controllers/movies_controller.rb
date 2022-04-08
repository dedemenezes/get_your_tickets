class MoviesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @movies = Movie.all
    http_cache_forever(public: true) do
      render
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @days_from_today = (DateTime.now..DateTime.now.days_since(7)).to_a
    @teathers = Teather.joins(:rooms, :exibithions).where(exibithions: { movie: @movie }).group(:id)

    fresh_when last_modified: @movie.updated_at.utc, etag: @movie
  end
end
