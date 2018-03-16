# Coin

A gem to play with AES encryption.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coin

## Usage

```ruby
> encrypted = Coin.encrypt(plaintext: 'secret')
=> {
      :data  => "\xA9704\xEDy",
      :key   => "\x9A\x04*=\x1E\x971uH9T\xDE2\x82A\xBAwH^\xDB\x15\x1D\xF1\x96\xD5V&]\xB9\xD4\x8F\xD5",
      :nonce => "\xC7\x93xn\xC3\x85\x87\xB3s{\x0E\xF7",
      :tag   => "\x9Dxs\a0;\xA8\x96\xC3\x03\x9C\x1D \xCE\xB1\x06"
   }
> Coin.decrypt(encrypted)
=> {:plaintext=>"secret"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/coin. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Coin project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/coin/blob/master/CODE_OF_CONDUCT.md).
