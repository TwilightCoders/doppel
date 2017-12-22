[![Version      ](https://img.shields.io/gem/v/doppel.svg?maxAge=2592000)](https://rubygems.org/gems/doppel)
[![Build Status ](https://travis-ci.org/TwilightCoders/doppel.svg)](https://travis-ci.org/TwilightCoders/doppel)
[![Code Climate ](https://api.codeclimate.com/v1/badges/427b6d065c1b772cecfb/maintainability)](https://codeclimate.com/github/TwilightCoders/doppel/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/427b6d065c1b772cecfb/test_coverage)](https://codeclimate.com/github/TwilightCoders/doppel/test_coverage)
[![Dependencies ](https://gemnasium.com/badges/github.com/TwilightCoders/doppel.svg)](https://gemnasium.com/github.com/TwilightCoders/doppel)

# Doppel

Doppel provides convenience scopes on your ActiveRecord Models for finding similar or exact records.

Compatible with ActiveRecord `4.0`, `4.1`, `4.2`, `5.0`, `5.1`

## Usage

Add this line to your application's Gemfile:

    gem 'doppel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doppel

### Application Code

Doppel is automatically available to your ActiveRecord Models

```ruby

class User < Account
  # ...
end

User.find_similar(:name)
```


## Contributing

1. Fork it ( https://github.com/TwilightCoders/active_record-mti/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
