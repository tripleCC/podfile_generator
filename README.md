# PodfileGenerator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'podfile_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install podfile_generator

## Usage

可以在发布阶段，根据 PodfileTemplate 和已知 Podfile 文件生成新的 Podfile

```shell
$ pgr --help

podfile generator 可以在发布阶段，根据 PodfileTemplate 和已知 Podfile 文件生成新的 Podfile
    -p, --podfile PATH               podfile path
    -t, --podfile-template PATH      podfile template
    -l, --label LABEL                label to be replaced
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/pgr` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/podfile_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PodfileGenerator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/podfile_generator/blob/master/CODE_OF_CONDUCT.md).
