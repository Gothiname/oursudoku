class SudokuManager
	attr_reader :sudoku_weights

	def initialize(grid='')
		@sudoku = Sudoku.new grid
		@sudoku_weights = SudokuWeight.new @sudoku
	end

	def solve
		return false unless @sudoku.is_valid && @sudoku.is_filled
		true
	end
end