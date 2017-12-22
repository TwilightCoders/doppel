[![Version      ](https://img.shields.io/gem/v/doppel.svg?maxAge=2592000)](https://rubygems.org/gems/doppel)
[![Build Status ](https://travis-ci.org/TwilightCoders/doppel.svg)](https://travis-ci.org/TwilightCoders/doppel)
[![Code Climate ](https://api.codeclimate.com/v1/badges/427b6d065c1b772cecfb/maintainability)](https://codeclimate.com/github/TwilightCoders/doppel/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/427b6d065c1b772cecfb/test_coverage)](https://codeclimate.com/github/TwilightCoders/doppel/test_coverage)
[![Dependencies ](https://gemnasium.com/badges/github.com/TwilightCoders/doppel.svg)](https://gemnasium.com/github.com/TwilightCoders/doppel)

# Doppel

## Description

This `acts_as` extension provides the ability to find similar records matching a set of specified fuzzy matched fields.

## Requirements

The database engine currently must impliment the [`levenshtein`](http://www.postgresql.org/docs/9.4/static/fuzzystrmatch.html) extension/feature. I believe this is currently limited to PostgreSQL.

## Installation

In your Gemfile:

    gem 'doppel'

Or, from the command line:

    gem install doppel

## Example

To use, call `has_many_doppels` method in the model:

```ruby
class Company < ActiveRecord::Base
  has_many_doppels [:name]
end

[1] pry(main)> duplicates = Company.with_name_doppels
  Company Load (89586.2ms)  SELECT DISTINCT companies.* FROM companies, companies as doppel_companies WHERE (companies.id != doppel_companies.id) AND (levenshtein(companies.name, doppel_companies.name) < 2) GROUP BY companies.id HAVING COUNT(doppel_companies.id) > 0
  Company Load (89586.2ms)  SELECT DISTINCT companies.* FROM companies, companies as doppel_companies WHERE (companies.id != doppel_companies.id) AND (levenshtein(companies.name, doppel_companies.name) < 2) GROUP BY companies.id HAVING COUNT(doppel_companies.id) > 0
=> [#<Company:0x007fe486a84a18 id: 4332, name: "Basically Infinity", created_at: ..., updated_at: ... >,
 #<Company:0x007fe485e70010 id: 5179, name: "Stucco", created_at: ..., updated_at: ... >,
 #<Company:0x007fe485e6b5d8 id: 3234, name: "ÜSER", created_at: ..., updated_at: ... >,
 #<Company:0x007fe485e6aae8 id: 8456, name: "Orange", created_at: ..., updated_at: ... >]

 # From here you'll be able to do the following.

[2] pry(main)> duplicates.first.name_doppels
Company Load (13.1ms)  SELECT "companies".* FROM "companies" WHERE (levenshtein('Basically Infinity', companies.name) < 2) AND ("companies"."id" != $1)  [["id", 4332]]
  Company Load (13.1ms)  SELECT "companies".* FROM "companies" WHERE (levenshtein('Basically Infinity', companies.name) < 2) AND ("companies"."id" != $1)  [["id", 4332]]
=> [#<Company:0x007fe483464a00 id: 4057, name: "Basically Infiniti", created_at: ..., updated_at: ... >]

# Note the different ID number as well.

```

## Instance Methods Added To ActiveRecord Models

You'll have a number of methods added to each instance of the ActiveRecord model that to which `doppel` is added.

These depend on how `has_many_doppels` is configured. For each field that is supplied, you'll have

`#{field_name}_doppels`

in addition to

`doppels`

which will return any matching duplicates from all fields supplied.

## The Future

Currently `doppel` only supports `levenshtein` text searching. I have tentative plans to impliment a more modular framework and support other field types such as dates or numerics.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
6. Patience

## Copyright

Copyright (c) 2015 Dale Stevens, released under the MIT license
