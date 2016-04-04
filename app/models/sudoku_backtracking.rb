class SudokuBacktracking
	attr_reader :sudoku_weights
	attr_reader :sudoku_solved
	attr_reader :cell_order

	def initialize(sudoku)
		@sudoku_solved = sudoku
	end

	def get_cell_order
		sudoku_weights = SudokuWeight.new @sudoku_solved
		cell_order = []
		k = 0
		for i in 0...@sudoku_solved.possibilities.length
			for j in 0...@sudoku_solved.possibilities.length
				if sudoku_weights.grid_weights[i][j] > -1
					cell_order[k] = {weight: sudoku_weights.grid_weights[i][j], coord: [i, j]}
					k += 1
				end
			end
		end
		cell_order.sort_by! { |x| [x[:weight], x[:coord][0], x[:coord][1]] }
	end

	def solve
		cell_order = get_cell_order
		fill_grid cell_order
	end

	def fill_grid cell_order
		return true if cell_order.length == 0 && @sudoku_solved.is_filled && @sudoku_solved.is_valid
		if cell_order.take(1)[0][:weight] == 1
			return true if fill_cell cell_order.take(1)[0][:coord][0], cell_order.take(1)[0][:coord][1], 0, cell_order
		else
			return true if fill_cell cell_order.take(1)[0][:coord][0], cell_order.take(1)[0][:coord][1], 1
		end
		false
	end

	def fill_cell i, j, flag, cell_order=nil
		@sudoku_solved.possibilities.each do |p|
			if @sudoku_solved.can_be_in_cell i, j, p
				@sudoku_solved.set_cell i, j, p
				return true if flag == 0 && (fill_grid cell_order.drop(1)) || flag == 1 && solve
				@sudoku_solved.set_cell i, j, '0'
			end
		end
		false
	end
end