class SudokuWeight
	def initialize(sudoku=nil)
		@sudoku = sudoku
		initialize_grid_weights unless @sudoku == nil
	end

	def get_weight(i, j)
		
	end

	def initialize_grid_weights
		@grid_weights = []
		(0..8).each do |i|
			@grid_weights[i] = []
			(0..8).each do |j|
				if @sudoku.get_cell i, j == 0
					@grid_weights[i][j] = get_weight i, j
				else
					@grid_weights[i][j] = -1
				end
			end
		end
	end
end