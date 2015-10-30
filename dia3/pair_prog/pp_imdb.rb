require 'imdb'
require 'pry'
# i = Imdb::Movie.new("0095016")
# puts i.title
# title1 = Imdb::Search.new('Ghostbusters')
# # title1.@query 
# title2 = Imdb::Search.new('Ghostbusters')
# title3 = Imdb::Search.new('Ghostbusters')
# title4 = Imdb::Search.new('Ghostbusters')
# title5 = Imdb::Search.new('Ghostbusters')
# title6 = Imdb::Search.new('Ghostbusters')
# title7 = Imdb::Search.new('Ghostbusters')
# title8 = Imdb::Search.new('Ghostbusters')
# title9 = Imdb::Search.new('Ghostbusters')

class Movie
	def initialize
		@file_titulos = "titulos.txt"
		@array_titulos = []


	end

	def read_file
		@content = IO.read(@file_titulos)
		@array_titulos = @content.split("\n")
	end

	def search_imdb
		search = Imdb::Search.new("Ghostbusters")
		puts search.movies[0].rating
		binding.pry

	end
end

my_movie = Movie.new
my_movie.search_imdb
#puts my_movie.read_file