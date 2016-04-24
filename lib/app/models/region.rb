# A region will return a specific SDR output based on the input it is provided and the previous state.
# To mimic the function of the Thalamus, a value is stored in the region itself as 'prev_active' which
# holds the output of the previous state. Input is passed into the 'output' function as an array of values.
# The values are part of a master set of values that is used to create the proximal dendrite SDRs.  To
# make this easier, an array of numbers is used and is automatically setup using the 'test' function.
class Region
  attr_accessor :columns, :prev_active
  def initialize
    @prev_active = []
    col_sets = [*1..Config::TOTAL_CELL_COUNT]
    @columns = {}
    (1..Config::COLUMNS).each do |idx|
      samp = col_sets.sample(Config::COLUMN_SAMPLE)
      @columns.merge!({idx => Column.new(samp)})
    end
  end

  # Returns the columns that have atleast one cell in it that would try to fire based on the input
  def effected_columns(data)
    @columns.select {|idx| !(@columns[idx].value & data).empty? }
  end

  # Returns an SDR based on the new input as well as the previous state
  def output(input)
    Config.predicted_cells = 0
    col_active = []
    col_total = 0
    @columns.each do |_, column|
      col_out = column.fire(input, @prev_active)
      unless col_out.empty?
        col_total += 1
        col_active += col_out
      end
    end

    Config.total_predicted_cells += 1 if Config.predicted_cells > 0

    print "Output Count: #{col_total} - Cell count: #{col_active.count}"
    print " #{Config.predicted_cells} predicted cells".green if Config.predicted_cells > 0
    puts
    @prev_active = col_active
    col_active
  end

  # Used to test the region with sample data
  def test
    output([*1..Config::TOTAL_CELL_COUNT].sample(Config::INPUT_SUBSAMPLE)).count
  end
end
