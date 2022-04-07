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
    fresh_when last_modified: @movie.updated_at.utc, etag: @movie
  end
end
