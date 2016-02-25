require 'set'
require_relative "layers/layer4"
module SDROB
  module Hierarchy
    # Constraints
    # -----------
    # A Column can 
    class Column
      attr_reader :layer1
      attr_reader :layer2
      attr_reader :layer3
      attr_reader :layer4
      attr_reader :layer5
      attr_reader :layer6

      def initialize
        @layer1 = Layer1.new
        @layer2 = Layer2.new
        @layer3 = Layer3.new
        @layer4 = Layer4.new
        @layer5 = Layer5.new
        @layer6 = Layer6.new
      end

    end
  end
end
