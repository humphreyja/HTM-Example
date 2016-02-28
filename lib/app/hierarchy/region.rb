require 'set'
module SDROB
  module Hierarchy
    class Region
      TOTALCOLUMNS = 100

      # Assign each cell a range of potential detrites with synapses with random range around threshold
      def initialize
      end

      # input SDR, if column overlap * booster is above threshold, activate column.
      # if not above, check if last active is less than a threshold, incr a booster
      def input
      end

      # get list of all active columns (maybe list of cells),
      # get list of all primed cells.
      def feedback
      end
    end
  end
end
