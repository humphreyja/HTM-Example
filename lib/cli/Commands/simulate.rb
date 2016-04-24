require "thor"

module HTM
  class Cli < Thor
    desc "simulate (int)", "Runs simulation data"
    long_desc <<-LONGDESC
      Runs a set of simulation data\r\n
      Provide an integer value to set the amount of times to run new input.\r\n
    LONGDESC

    def simulate(count)
      Config.print_heading("Running Simulate...")
      root = Region.new
      count = count.to_i
      [*1..count].each do
        root.test
      end


      root.columns.each do |idx, column|
        column.cells.each do |cell|
          cell.distral.each do |synapse, strength|
            Config.total_connections += 1 if strength >= Config::SYNAPSE_STRENGTH
          end
        end
      end


      Config.print_heading("Simulation Data", :yellow)
      puts "Strongest Synapse: #{Config.strongest_connection}".yellow
      puts "Total Active Relationships: #{Config.total_connections}".yellow
      puts "Total Predicted Patterns: #{Config.total_predicted_cells}".yellow
      puts
      Config.run_time
      puts
    end
  end
end
