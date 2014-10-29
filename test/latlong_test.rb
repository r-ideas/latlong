require 'minitest_helper'

class TestLatlong < MiniTest::Unit::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Latlong::VERSION
  end

  def test_location_by_yandex_provider
    VCR.insert_cassette 'yandex'
    Latlong.configuration.provider = :yandex

    results = Latlong.location 'Sacramento'
    result = results.first

    assert_equal results.count, 10

    assert_equal result.address, 'Sacramento, US'
    assert_equal result.position, 0
    assert_equal result.lon, -121.490899
    assert_equal result.lat, 38.579324

    VCR.eject_cassette
  end

  def test_location_by_google_provider
    VCR.insert_cassette 'google'
    Latlong.configuration.provider = :google

    results = Latlong.location 'Sacramento'
    result = results.first

    assert_equal results.count, 3

    assert_equal result.address, 'Sacramento, US'
    assert_equal result.position, 0
    assert_equal result.lon, -121.4943996
    assert_equal result.lat, 38.5815719


    VCR.eject_cassette
  end
end
