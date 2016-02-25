require 'set'
module SDROB
  class Neuron
    attr_accessor :describer
    def initialize(describer)
      @describer = describer
    end
  end
end
