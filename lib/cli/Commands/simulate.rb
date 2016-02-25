require "thor"
module SDROB
  class Cli < Thor
    desc "simulate", "Runs simulation data"
    long_desc <<-LONGDESC
      Runs a set of simulation data\r\n
    LONGDESC

    def simulate
      puts "Running Simulate"
    end
  end
end
