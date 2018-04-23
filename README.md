# SlackTransformer

Tools for working with HTML, mrkdwn, and Slack commands in Ruby

See [Basic message formatting](https://api.slack.com/docs/message-formatting) for Slack's message formatting guidelines.

## Installation

### RubyGems

```bash
gem install slack_transformer
```

### Bundler

```ruby
gem 'slack_transformer'
```

## HTML to Slack

```ruby
SlackTransformer::Html.new('<b><i>important stuff</i></b>').to_slack
# => "*_important stuff_*"
```

`SlackTransformer::Html` applies the following transformations in the order listed:

* [bold](#bold)
* [italics](#italics)
* [strikethrough](#strikethrough)
* [code](#code)
* [preformatted](#preformatted)
* [lists](#lists)

Note: Slack doesn't support underline.

Each transformation can also be applied individually.

### Bold

```ruby
SlackTransformer::Html::Bold.new('<b>bold</b>').to_slack
# => "*bold*"
```

### Italics

```ruby
SlackTransformer::Html::Italics.new('<i>italics</i>').to_slack
# => "_italics_"
```

### Strikethrough

```ruby
SlackTransformer::Html::Strikethrough.new('<s>strikethrough</s>').to_slack
# => "~strikethrough~"
```

### Code

```ruby
SlackTransformer::Html::Code.new('<code>code</code>').to_slack
# => "`code`"
```

### Preformatted

```ruby
SlackTransformer::Html::Preformatted.new('<pre>preformatted</pre>').to_slack
# => "```preformatted```"
```

### Lists

```ruby
SlackTransformer::Html::Lists.new('<ul><li>foo</li><li>bar</li><li>baz</li></ul>').to_slack
# => "• foo\n• bar\n• baz"

SlackTransformer::Html::Lists.new('<ol><li>foo</li><li>bar</li><li>baz</li></ol>').to_slack
# => "1. foo\n2. bar\n3. baz"
```

## Entities

```ruby
SlackTransformer::Entities.new('&<>').to_slack
# => "&amp;&lt;&gt;"
```

## Date

`SlackTransformer::Date` understands anything that `Time::parse` understands.

```ruby
SlackTransformer::Date.new('2018-05-04T00:00:00Z', format: '{date_pretty}', fallback: 'May 4, 2018').to_slack
# => "<!date^1525392000^{date_pretty}|May 4, 2018>"
```

## Slack to HTML

```ruby
SlackTransformer::Slack.new('*_important stuff_*').to_html
# => "<p><b><i>important stuff</i></b></p>"
```

`SlackTransformer::Slack` applies the following transformations in the order listed:


* [bold](#bold-1)
* [italics](#italics-1)
* [strikethrough](#strikethrough-1)
* [code](#code-1)
* [preformatted](#preformatted-1)
* [quote](#quote)*
* [blockquote](#blockquote)*

\* Adjacent or nested quotes and blockquotes may not behave as expected.

Each transformation can also be applied individually.


### Bold

```ruby
SlackTransformer::Slack::Bold.new('*bold*').to_html
# => "<b>bold</b>"
```

### Italics

```ruby
SlackTransformer::Slack::Italics.new('_italics_').to_html
# => "<i>italics</i>"
```

### Strikethrough

```ruby
SlackTransformer::Slack::Strikethrough.new('~strikethrough~').to_html
# => "<s>strikethrough</s>"
```

### Code

```ruby
SlackTransformer::Slack::Code.new('`code`').to_html
# => "<code>code</code>"
```

### Preformatted

```ruby
SlackTransformer::Slack::Preformatted.new('```preformatted```').to_html
# => "<pre>preformatted</pre>"
```

### Quote

```ruby
SlackTransformer::Slack::Quote.new('>quote').to_html
# => "<blockquote>quote</blockquote>"
```

### Blockquote

```ruby
SlackTransformer::Slack::Blockquote.new(">>>blockquote\nblockquote").to_html
# => "<blockquote>blockquote<br>blockquote</blockquote>"
```

## Contributing

The following transformations are either not yet supported or partially supported:

**HTML to Slack**
* [ ] blockquote

**Slack to HTML**
* [ ] quote*
* [ ] blockquote*
* [ ] lists

\* Adjacent or nested quotes and blockquotes may not behave as expected.

## License

MIT License

Copyright © 2018 [Everwise](https://github.com/everwise)
