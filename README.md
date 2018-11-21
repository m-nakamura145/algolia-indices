# algolia-indices

A command line tool for [Algolia](https://www.algolia.com). algolia-indices has the following features:

* **Import records**: You can import the record of the yaml file into the specified algolia index.   

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'algolia-indices'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install algolia-indices

## Usage

```
# Import the record of the yaml file into the specified algolia index
$ algolia-indices import [API-KEY] [APPLICATION-ID] [INDEX-NAME] [FILE-PATH]

```

### Algolia API-Key

You must generate an API key that gave the Add object and Delete Object permissions.

see [Algolia API Key document](https://www.algolia.com/doc/guides/security/api-keys/#api-key-restrictions).

### Import data format

Create data source in `yaml` format.

```yaml
records:
  - name: sample_restaurant1
  - name: sample_restaurant2

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/m-nakamura145/algolia-indices](https://github.com/m-nakamura145/algolia-indices). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Algolia::Indices project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/algolia-indices/blob/master/CODE_OF_CONDUCT.md).
