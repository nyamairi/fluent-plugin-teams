# Fluent::Plugin::Teams

fluentd output plugin for [Teams](https://www.microsoft.com/ja-jp/education/products/teams/default.aspx)

## Installation

    $ gem install fluent-plugin-teams

## Configure

```
<match **>
  @type teams
  webhook_url http://example.com/teams/webhook
  text "<%= Time.at(time) %>\nHello <%= record['user'] %>!"
</match>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fluent-plugin-teams. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Fluent::Plugin::Teams project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fluent-plugin-teams/blob/master/CODE_OF_CONDUCT.md).
