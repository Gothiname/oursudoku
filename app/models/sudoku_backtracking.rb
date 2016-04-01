class SudokuBacktracking
	attr_reader :sudoku_weights
	attr_reader :sudoku_solved
	attr_reader :cell_order

	def initialize(sudoku=nil)
		@sudoku_solved = sudoku.dup
		@sudoku_weights = SudokuWeight.new @sudoku_solved
		initialize_cell_order sudoku
	end

	def initialize_cell_order(sudoku=nil)
		@cell_order = []
		k = 0
		for i in 0..(sudoku.possibilities.length - 1)
			for j in 0..(sudoku.possibilities.length - 1)
				if @sudoku_weights.grid_weights[i][j] > -1
					@cell_order[k] = {weight: @sudoku_weights.grid_weights[i][j], cell: [i, j]}
					k += 1
				end
			end
		end
		@cell_order.sort_by! { |x| [x[:weight], x[:cell][0], x[:cell][1]] }
	end

	def solve

	end
end