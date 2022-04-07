class MoviesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @movies = Movie.all
  end

  def show
  end
end
