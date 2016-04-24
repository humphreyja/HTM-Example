require "thor"
require_relative "../lib/HTM"

module HTM
  class CLI < Thor
  end
end

HTM::Cli.start(ARGV)
