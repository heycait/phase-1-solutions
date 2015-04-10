class Sudoku
  attr_accessor :board
  def initialize(board_string)
    @board = board_string.split("")
    @board.map! do |element|
      element.to_i
    end
  end

  def solve
    find_empty_cells.join("")
  end

  def find_empty_cells
    while @board.include?(0)
      @board.map!.with_index do |number, index|

        if number == 0
          possibilities = [1,2,3,4,5,6,7,8,9]
          row = (index / 9)
          column = (index % 9)
          retrieved_numbers = retrieve_column_numbers(column).concat(retrieve_row_numbers(row)).concat(retrieve_box_numbers(row, column))
          result_array = possibilities - (retrieved_numbers.uniq!)
          if result_array.length == 1
            number = result_array[0]  #this should replace the 0 in the board with the proper number
          else
            number #else this should keep 0 as 0
          end

        else
          number #this should keep the number as the number
        end
      end
    end
    @board
  end

  def retrieve_column_numbers(column)
    found_columns = []
    @board.each_with_index do |number, index|
      if (index % 9 == column) && (number != 0)
        found_columns << number
      end
    end
    found_columns
  end

  def retrieve_row_numbers(row)
    found_rows = []
    @board.each_with_index do |number, index|
      if ((index / 9) == row) && (number != 0)
        found_rows << number
      end
    end
    found_rows
  end

  def retrieve_box_numbers(row, column)
    box_numbers = []
    box_were_in = (row/3*3) + (column/3)
    @board.each_with_index do |number, index|
      current_numbers_box = ((index/9/3*3) + (index%9/3))
      if (current_numbers_box == box_were_in) && (number != 0)
        box_numbers << number
      end
    end
    box_numbers
  end

  #display pretty board
  def board

  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    pretty = @board.each_slice(9).to_a.each do |array|
      puts array
    end
  end
end



game = Sudoku.new('4-5269781682571493197834562826195347374682915951743628519326874248957136763418259')
game.solve



