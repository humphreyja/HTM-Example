require "thor"
module SDROB
  class Cli < Thor
    desc "simulate", "Runs simulation data"
    long_desc <<-LONGDESC
      Runs a set of simulation data\r\n
    LONGDESC

    def simulate
      puts "Running Simulate..."
      n = Cell::Neuron.new([2,4,5])
      r = Hierarchy::Region.new
      puts r.layer4
    end
  end
end
