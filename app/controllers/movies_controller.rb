class MoviesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @days_from_today = (DateTime.now..DateTime.now.days_since(6)).to_a

    @teathers = Teather.joins(:rooms, :exibithions).where(exibithions: { movie: @movie }).group(:id)
    if params[:date]
      @teathers = Teather.joins(:rooms, :exibithions)
                         .where(exibithions: { movie: @movie,
                                               start_time: params[:date].to_date.beginning_of_day..params[:date].to_date.end_of_day })
                         .group(:id)
    end
    fresh_when last_modified: @movie.exibithions.order(:id).last.updated_at.utc, etag: @movie
  end
end
