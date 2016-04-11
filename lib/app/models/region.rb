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

  def effected_columns(data)
    @columns.select {|idx| !(@columns[idx].value & data).empty? }
  end

  def output(input)
    col_active = []
    col_total = 0
    @columns.each do |_, column|
      col_out = column.fire(input, @prev_active)
      unless col_out.empty?
        col_total += 1
        col_active += col_out
      end
    end
    puts "Output Count: #{col_total} - Cell count: #{col_active.count}"
    @prev_active = col_active
    col_active
  end

  def test
    output([*1..Config::TOTAL_CELL_COUNT].sample(10)).count
  end
end
