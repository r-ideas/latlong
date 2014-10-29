require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'latlong'

require 'minitest/autorun'

require 'turn'
require 'pry'

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/vcr_cassettes'
  c.hook_into :webmock
  c.ignore_hosts 'codeclimate.com'
end

Turn.config.format = :dot
