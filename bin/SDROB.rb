require "thor"
require_relative "../lib/SDROB"

module SDROB
  class CLI < Thor
  end
end

SDROB::Cli.start(ARGV)
