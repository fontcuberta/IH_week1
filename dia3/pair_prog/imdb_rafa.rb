require 'imdb'

class GraphicCreator
 def initialize films
   @films = films
   @rating = 10
 end

 def print_graphic
   graphic = Array.new(@rating) { Array.new(@films.size) { "#" } }

   graphic.each(@films[1]..@films.size) do |nota|
     nota = " "
   end

 end

 def print_movies
   @films.each_with_index do |movie, index|
     puts "#{index + 1}. #{movie[0]}"
   end
 end

 def print
   print_graphic
   print_movies
 end

end


class FilmReader
 def initialize file
   @file = file
   @films = []
 end

 def load_films 
   loaded = IO.read(@file)
   @films = loaded.split("\n")
 end
 def get_films
   @films
 end
end


class Film

class FilmHandlerImdb
 def initialize films
   @films = films
 end

 def load_films_imdb
   @films = @films.map do |film|
     imdb_films = Imdb::Search.new(film) 
     [imdb_films.movies[0].title, imdb_films.movies[0].rating] 
   end    
 end

 def get_films
   @films
 end
end

films = Films.new("movies.txt")
graphic = CreateGraphic.new(films.load)
graphic.print

=begin
imdb = Imdb::Search.new("Star Wars")

puts imdb.movies[0].title
puts imdb.movies[0].rating
=end

rafael_ramon_fraga [6:24 PM]
Esta sin terminar, y no se si funciona porque cambie algunas cosas nada más sentarnos y luego lo deje para hacer el de Quino