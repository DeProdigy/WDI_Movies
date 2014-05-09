class MoviesController < ActionController::Base

  layout "application"

  def index

  end

  def search
    movie_title = params[:movie_title]
    Movie.search(movie_title)
    redirect_to '/all'
  end

  def all
    @movies = Movie.all
  end

end