# Latlong

Finds latitude and longitude for given address

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'latlong'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install latlong

## Usage

In order to fetch coordinates for address, do this:

```ruby
require 'latlong'

Latlong.configure do |config|
  config.provider = :yandex # or :google by default
end

results = Latlong.location 'Sacramento' # returns array of items with
                                        # coordinates and address

results.first.address   # 'Sacramento, US'
results.first.lat       # 38.5815719
results.first.lon       # -121.4943996
```

Also possible to enable caching for requests through [redis](https://github.com/redis/redis-rb):

```ruby
require 'latlong'
require 'redis'

Latlong.configure do |config|
  config.provider = :yandex # or :google by default
  config.cache    = true
end
```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/latlong/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
