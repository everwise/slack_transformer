require 'slack_transformer/slack/blockquote'
require 'slack_transformer/slack/bold'
require 'slack_transformer/slack/code'
require 'slack_transformer/slack/italics'
require 'slack_transformer/slack/preformatted'
require 'slack_transformer/slack/quote'
require 'slack_transformer/slack/strikethrough'

module SlackTransformer
  class Slack
    attr_reader :input

    TRANSFORMERS = [
      SlackTransformer::Slack::Bold,
      SlackTransformer::Slack::Italics,
      SlackTransformer::Slack::Strikethrough,
      SlackTransformer::Slack::Code,
      SlackTransformer::Slack::Preformatted,
      SlackTransformer::Slack::Quote,
      SlackTransformer::Slack::Blockquote
    ]

    def initialize(input)
      @input = input
    end

    def to_html
      html = TRANSFORMERS.reduce(input) do |working_html, transformer|
        transformer.new(working_html).to_html
      end

      "<p>#{html.gsub("\n", '<br>')}</p>"
    end
  end
end
