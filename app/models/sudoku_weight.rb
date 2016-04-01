class SudokuWeight
	attr_reader :grid_weights

	def initialize(sudoku=nil)
		@sudoku = sudoku
		initialize_grid_weights unless @sudoku == nil
	end

	def get_weight(i, j)
		return -1 unless @sudoku.cell_is_empty i, j
		weight = 0
		@sudoku.possibilities.each do |character|
			weight += 1 if (@sudoku.can_be_in_line i, character) && (@sudoku.can_be_in_col j, character) && (@sudoku.can_be_in_square i, j, character)
		end
		weight
	end

	def initialize_grid_weights
		@grid_weights = []
		for i in 0..(@sudoku.possibilities.length - 1)
			@grid_weights[i] = []
			for j in 0..(@sudoku.possibilities.length - 1)
				@grid_weights[i][j] = get_weight i, j
			end
		end
	end
end