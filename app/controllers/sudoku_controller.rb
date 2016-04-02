class SudokuController < ApplicationController
  def index
    unless params[:depth].blank?
      @depth = params[:depth].to_i
    end
  end

  def construct_string_params depth
    sudoku_str = ''
    (0...depth**2).each do |i|
      (0...depth**2).each do |j|
        sudoku_str += '0' if params[("#{i}-#{j}").to_sym].blank?
        sudoku_str += params[("#{i}-#{j}").to_sym] unless params[("#{i}-#{j}").to_sym].blank?
      end
    end
    sudoku_str
  end

  def solved
    depth = params[:depth].to_i
    @sudoku = Sudoku.new (construct_string_params depth), depth
    sudoku_manager = SudokuManager.new
    sudoku_manager.solve @sudoku
  end
end