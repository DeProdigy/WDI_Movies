class Movie < ActiveRecord::Base

  def self.search(movie_title)
    fixed_name = movie_title.gsub(' ', '%20')
    movie = JSON.parse(HTTParty.get("http://www.omdbapi.com/?t=#{fixed_name}").body)
    self.save_movie(movie)
  end

  def self.save_movie(movie)
    new_movie = Movie.new
    new_movie.title = movie['Title']
    new_movie.year = movie['Year']
    new_movie.rated = movie['Rated']
    new_movie.released = movie['Released']
    new_movie.runtime = movie['Runtime']
    new_movie.genre = movie['Genre']
    new_movie.director = movie['Director']
    new_movie.writer = movie['Writer']
    new_movie.actors = movie['Actors']
    new_movie.plot = movie['Plot']
    new_movie.movie_poster = movie['Poster']
    new_movie.save
  end

end
