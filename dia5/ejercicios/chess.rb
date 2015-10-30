require 'pry'
class Board

	def initialize
		@board = []
	end

	def fill_board
		8.times{@board.push(Array.new(8,0))}
	end

	def placeElement
		@board[0][0] = "bR"
		@board[0][7] = "bR"
		@board[7][0] = "wR"
		@board[7][7] = "wR"
		# binding.pry
	end

end

my_board = Board.new
my_board.fill_board
my_board.placeElement

class Rook

	def initialize(_chessBoard)
		@chessBoard = _chessBoard
	end

	def validate_move(origin,destination)
		if move_forward(origin,destination) == true
			puts "LEGAL"
		else
			puts ILLEGAL
		end
	end

	def move_forward(origin,destination)
		mov_horizontal = (origin[0] == destination[0] && origin[1] != destination[1])
		mov_vertical = (origin[1] == destination[1] && origin[0] != destination[0])
		mov_vertical || mov_horizontal
	end
end

my_rook = Rook.new(my_board)
# my_rook.validate_move([0,0],[3,0])

class Pown

	def initialize(_chessBoard)
		@chessBoard = _chessBoard
	end

	def validate_move(origin,destination)
		if move_forward(origin,destination) == true
			puts "LEGAL"
		else
			puts "ILLEGAL"
		end
	end

	def move_forward(origin,destination)
		mov_vertical = (origin[1] == destination[1]) && (destination[0] <= origin[0] + 2 )
		mov_vertical
		
	end
end

my_pown = Pown.new(my_board)

my_pown.validate_move([0,0],[1,0])
my_pown.validate_move([0,0],[2,0])
my_pown.validate_move([0,0],[3,0])




