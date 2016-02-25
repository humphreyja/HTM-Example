require 'set'
require_relative "neuron/states"
module SDROB
  module Cell
    class Neuron
      attr_accessor :describer

      def initialize(describer)
        @describer = describer
        inactive
      end

      def fire

      end
    end
  end
end
