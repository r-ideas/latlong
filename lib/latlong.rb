require 'latlong/version'
require 'latlong/configuration'
require 'latlong/location'

module Latlong

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.location term
    Location.new(term).results
  end

end
