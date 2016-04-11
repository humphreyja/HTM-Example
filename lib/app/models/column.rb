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

  def fire(input, prev_input = [])
    ret_val = find_first_primed_cell_idx(input, prev_input)
    primed_cell = ret_val.first
    strength = ret_val.last

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
