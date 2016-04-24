# By giving the column a value of all the possible values that its cells' proximal dendrite values could
# be, it allows for greater speed as the column can be ignored if there are no cells that would be effected
# by the input.
class Column
  attr_accessor :cells, :value
  def initialize(values)
    possible_proximal_values = values
    @value = values
    @cells = []
    (1..Config::CELLS_PER_LAYER).each do
      proximal = possible_proximal_values.sample(Config::CELL_SAMPLE)
      @cells << Cells::Layer23.new(proximal)
    end
  end

  # Will try to fire the column if any of its cells match with the input and
  # if the strength is above the config threshold
  def fire(input, prev_input = [])
    ret_val = find_first_primed_cell_idx(input, prev_input)
    primed_cell = ret_val.first
    strength = ret_val.last

    # If above column strength, fire just the cell or fire the entire column
    if strength > Config::COLUMN_STRENGTH
      if primed_cell.nil?
        @cells.each do |cell|
          cell.predicted(prev_input)
        end
        return @cells
      else
        @cells[primed_cell].predicted(prev_input)
        return [@cells[primed_cell]]
      end
    end
    []
  end

private

  # Locates a primed cell if one exists.  If one does not exist, it will
  # return a nil cell and the strength of the column
  def find_first_primed_cell_idx(input, prev_input = [])
    strength = 0
    primed = nil
    @cells.each_with_index do |cell, idx|
      unless (cell.proximal & input).empty?
        strength += 1
        if primed.nil?
          primed ||= idx if cell.primed?(prev_input)
        end
      end
    end
    [primed, strength]
  end
end
