require 'set'
module SDROB
  module Cell
    class Neuron
      attr_reader :state

      def active
        @state = :active
      end

      def inactive
        @state = :inactive
      end

      def primed
        @state = :primed
      end

      def primed?
        return true if @state == :primed
        false
      end

      def inactive?
        return true if @state == :inactive
        false
      end

      def active?
        return true if @state == :active
        false
      end
    end
  end
end
