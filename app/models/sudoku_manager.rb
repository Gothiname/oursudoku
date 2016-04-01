class SudokuManager
	attr_reader :sudoku_solver

	def initialize
	end

	def solve(sudoku=nil)
		return false if sudoku == nil
		@sudoku_solver = SudokuBacktracking.new sudoku
		# @sudoku_solver.solve
		return false unless sudoku.is_valid && sudoku.is_filled
		true
	end
end