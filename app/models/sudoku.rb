class Sudoku
	attr_reader :depth
	attr_reader :possibilities
	attr_reader :side_length

	def init_possibilities
		@possibilities = []
		for i in 0..(@side_length - 1)
			@possibilities[i] = ((i < 9 ? 49 : 56) + i).chr
		end
	end

	def initialize(grid='', depth=3)
		raise 'Depth not authorized' unless depth <= 4 && depth >= 2
		@grid = nil
		@depth = depth
		@side_length = @depth ** 2
		init_possibilities
		raise 'Invalid grid' unless initialize_grid_from_string grid
	end

	def is_good_character(grid_string='')
		/\A[#{@possibilities}|0]+\z/.match(grid_string)
	end

	def initialize_grid_from_string(grid_string='')
		if grid_string.length == @side_length ** 2 && is_good_character(grid_string)
			@grid = []
			i = 0
			j = 0
			grid_string.split('').each do |cell|
				@grid[i] = [] if j == 0
				@grid[i][j] = cell
				j += 1
				if j == @side_length
					j = 0
					i += 1
				end
			end
			return true
		end
		false
	end

	def check_cell(cell, numbers)
		if cell != '0'
			if numbers.include? cell
				numbers.delete cell
			else
				return false
			end
		end
		true
	end

	def check_line(i)
		numbers = @possibilities.dup
		for j in 0..(@possibilities.length - 1)
			return false unless check_cell @grid[i][j], numbers
		end
		true
	end

	def check_lines
		for i in 0..(@possibilities.length - 1)
			return false unless check_line i
		end
		true
	end

	def check_col(j)
		numbers = @possibilities.dup
		for i in 0..(@possibilities.length - 1)
			return false unless check_cell @grid[i][j], numbers
		end
		true
	end

	def check_cols
		for j in 0..(@possibilities.length - 1)
			return false unless check_col j
		end
		true
	end

	def check_square(i, j)
		numbers = @possibilities.dup
		for k in 0..(@depth - 1)
			for l in 0..(@depth - 1)
				return false unless check_cell @grid[i + k][j + l], numbers
			end
		end
		true
	end

	def check_squares
		for i in 0..(@depth - 1)
			for j in 0..(@depth - 1)
				return false unless check_square i * @depth, j * @depth
			end
		end
		true
	end

	def is_valid
		return false unless check_lines && check_cols && check_squares
		true
	end

	def is_filled
		for i in 0..(@possibilities.length - 1)
			for j in 0..(@possibilities.length - 1)
				return false unless @grid[i][j] != '0'
			end
		end
		true
	end

	def can_be_in_line(i, character)
		for j in 0..(@possibilities.length - 1)
			return false if @grid[i][j] == character
		end
		true
	end

	def can_be_in_col(j, character)
		for i in 0..(@possibilities.length - 1)
			return false if @grid[i][j] == character
		end
		true
	end

	def can_be_in_square(i, j, character)
		line_start = (i / @depth).to_i * @depth
		col_start = (j / @depth).to_i * @depth
		for k in line_start..(line_start + @depth - 1)
			for l in col_start..(col_start + @depth - 1)
				return false if @grid[k][l] == character
			end
		end
		true
	end

	def can_be_in_cell(i, j, character)
		return true if (can_be_in_line i, character) && (can_be_in_col j, character) && (can_be_in_square i, j, character)
		false
	end

	def get_grid
		@grid
	end

	def get_cell(i, j)
		@grid[i][j]
	end

	def set_cell(i, j, value)
		@grid[i][j] = value
	end

	def cell_is_empty(i, j)
		@grid[i][j] == '0'
	end
end