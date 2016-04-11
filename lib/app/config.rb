class Config
  COLUMNS = 100
  COLUMN_SAMPLE = 100
  CELLS_PER_LAYER = 10
  CELL_SAMPLE = 25
  COLUMN_STRENGTH = 5
  TOTAL_CELL_COUNT = Config::COLUMNS * Config::CELLS_PER_LAYER

  SYNAPSE_STRENGTH = 0.4
  SYNAPSE_INCR = 0.2
  SYNAPSE_DECR = 0.01
  SYNAPSE_EXPIRE = 0.01
  SYNAPSE_DELETE = 0.001
  SYNAPSE_BUILDUP = 1


  @@strongest_connection = 0
  def self.strongest_connection
    @@strongest_connection
  end

  def self.strongest_connection=(val)
    @@strongest_connection = val
  end
end

require_relative "models/cell"
require_relative "models/cells/layer4"
require_relative "models/cells/layer23"
require_relative "models/column"
require_relative "models/region"
require_relative "models/synapse"
