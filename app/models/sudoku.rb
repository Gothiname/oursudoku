class Sudoku
	def sudoku_numbers
		[1, 2, 3, 4, 5, 6, 7, 8, 9]
	end

	def initialize(grid='')
		@grid = nil
		raise 'Grille non valide' unless initialize_grid_from_string grid
	end

	def is_numeric(grid_string='')
		/\A\d+\z/.match(grid_string)
	end

	def initialize_grid_from_string(grid_string='')
		if grid_string.length == 81 && is_numeric(grid_string)
			@grid = []
			line = 0
			col = 0
			grid_string.split('').each do |cell|
				@grid[line] = [] if col == 0
				@grid[line][col] = cell.to_i
				col += 1
				if col == 9
					col = 0
					line += 1
				end
			end
			return true
		end
		false
	end

	def check_cell(cell, numbers)
		if cell != 0
			if numbers.include? cell
				numbers.delete cell
			else
				return false
			end
		end
		true
	end

	def check_line(i)
		numbers = sudoku_numbers
		(0..8).each do |j|
			return false unless check_cell @grid[i][j], numbers
		end
		true
	end

	def check_lines
		(0..8).each do |i|
			return false unless check_line i
		end
		true
	end

	def check_col(j)
		numbers = sudoku_numbers
		(0..8).each do |i|
			return false unless check_cell @grid[i][j], numbers
		end
		true
	end

	def check_cols
		(0..8).each do |j|
			return false unless check_col j
		end
		true
	end

	def check_square(i, j)
		numbers = sudoku_numbers
		(0..2).each do |k|
			(0..2).each do |l|
				return false unless check_cell @grid[i + k][j + l], numbers
			end
		end
		true
	end

	def check_squares
		i = 0
		while i <= 6
			j = 0
			while j <= 6
				return false unless check_square i, j
				j += 3
			end
			i += 3
		end
		true
	end

	def is_valid
		return false unless check_lines && check_cols && check_squares
		true
	end

	def is_filled
		(0..8).each do |i|
			(0..8).each do |j|
				return false unless @grid[i][j] != 0
			end
		end
		true
	end

	def get_grid
		@grid
	end

	def get_cell(i, j)
		@grid[i][j]
	end
end