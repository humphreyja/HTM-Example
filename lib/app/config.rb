# Use this class to change the biological thresholds and values used in the program
class Config
  # Amount of active bits in the inputted pattern
  INPUT_SUBSAMPLE = 10

  # Amount of columns per region
  COLUMNS = 100

  # Amount of SDR indexes that are to be assigned to the entire column and distributed to the cells
  COLUMN_SAMPLE = 100

  # Amount of cells inside each of the columns
  CELLS_PER_LAYER = 10

  # Amount of SDR indexes that are asigned to the generalized proximal dendrite SDR.
  CELL_SAMPLE = 25

  # The threshold strength that a column requires to fire.
  # This is used to inhibit the weaker columns, only allowing columns with more active cells to fire
  COLUMN_STRENGTH = 5

  # The threshold that relationships require to overcome to become an active relationship
  SYNAPSE_STRENGTH = 0.4

  # The amount a relationship is incremented each time a cell successfully predicts itself
  SYNAPSE_INCR = 0.2

  # The amount a relationship is decremented if a cell predicts incorrectly
  SYNAPSE_DECR = 0.01

  # The amount a relationship decays after every input it is not used
  SYNAPSE_EXPIRE = 0.01

  # The amount a relationship is fully removed from the Distal Dendrite relationship list
  SYNAPSE_DELETE = 0.001

  # The amount of relationships required to set the cell into the predictive state
  SYNAPSE_BUILDUP = 1

  # NOTE: DO NOT CHANGE THIS VALUE
  # The total amount of attributes an SDR can have.  Each cell outputs a single bit for the next state SDR
  TOTAL_CELL_COUNT = Config::COLUMNS * Config::CELLS_PER_LAYER

  # This will keep track of the strongest synaptic connection (Distal Dendrite relationship)
  @@strongest_connection = 0
  def self.strongest_connection
    @@strongest_connection
  end

  def self.strongest_connection=(val)
    @@strongest_connection = val
  end

  @@total_connections = 0
  def self.total_connections
    @@total_connections
  end

  def self.total_connections=(val)
    @@total_connections = val
  end
end

require_relative "models/cells/layer23"
require_relative "models/column"
require_relative "models/region"
