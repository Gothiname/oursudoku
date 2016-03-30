class SudokuManager

	def initialize(grid='')
		@sudoku = Sudoku.new grid
	end

	def solve
		return false unless @sudoku.is_valid && @sudoku.is_filled
		true
	end
end