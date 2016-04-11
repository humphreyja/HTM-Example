require "thor"
module SDROB
  class Cli < Thor
    desc "simulate", "Runs simulation data"
    long_desc <<-LONGDESC
      Runs a set of simulation data\r\n
    LONGDESC

    def simulate(count)
      puts "Running Simulate..."
      root = Region.new
      count = count.to_i
      [*1..count].each do
        root.test
      end

      puts "Strongest Synapse: #{Config.strongest_connection}"

    end
  end
end
