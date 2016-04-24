# This is a layer 2/3 cell.  It has a normal state and a primed state.  It also holds the previous input of that column
# so that it can determine what relationships to build and which ones to decay.
module Cells
  class Layer23 < ::Cell
    attr_accessor :proximal, :distral, :cycles_since_last_fire, :state, :previous_input
    def initialize(val)
      @proximal = val
      @distral = {}
      @cycles_since_last_fire = 0
      @state = :normal
      @previous_input = []
    end

    # Called every time a column determines if it will fire
    def primed?(prev_input)
      return false if prev_input.count < 1

      # If a cell is still in a primed state here, it predicted incorrectly
      decrement_predicted_relationships if @state == :primed

      @previous_input = []
      prev_input.each do |inp|
        if @distral.key?(inp.proximal)
          if @distral[inp.proximal] >= Config::SYNAPSE_STRENGTH
            @previous_input << inp
          end
        end
      end
      if @previous_input.count > Config::SYNAPSE_BUILDUP
        @state = :primed
        return true
      end
      false
    end

    # Called only if the cell fires
    def predicted(prev_input)
      prev_input.each do |cell|
        if @distral.key?(cell.proximal)
          @distral[cell.proximal] += Config::SYNAPSE_INCR
          Config.strongest_connection = @distral[cell.proximal] if @distral[cell.proximal] > Config.strongest_connection
        else
          @distral.merge!({cell.proximal => 0.1})
        end
      end

      # Decays the relationships
      Thread.new {
        @distral.each do |syn, strength|
          strength -= Config::SYNAPSE_EXPIRE
          @distral.delete(syn) if strength < Config::SYNAPSE_DELETE
        end
      }
      nil
    end

  private

    # Called only when a cell predicts incorrectly
    def decrement_predicted_relationships
      @previous_input.each do |cell|
        if @distral.key?(cell.proximal)
          @distral[cell.proximal] -= Config::SYNAPSE_DECR
          @distral.delete(cell.proximal) if @distral[cell.proximal] < Config::SYNAPSE_DELETE
        end
      end
      @state = :normal
      nil
    end
  end
end
