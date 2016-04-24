require "thor"
module HTM
  class Cli < Thor
    desc "simulate (int)", "Runs simulation data"
    long_desc <<-LONGDESC
      Runs a set of simulation data\r\n
      Provide an integer value to set the amount of times to run new input.\r\n
    LONGDESC

    def simulate(count)
      puts "Running Simulate..."
      root = Region.new
      count = count.to_i
      [*1..count].each do
        root.test
      end

      root.columns.each do |column|
        column.cells.each do |cell|
          cell.distral.each do |synapse, strength|
            Config.total_connections += 1 if strength >= Config::SYNAPSE_STRENGTH
          end
        end
      end

      ap "Strongest Synapse: #{Config.strongest_connection}"
      ap "Total Active Relationships: #{Config.total_connections}"


    end
  end
end
