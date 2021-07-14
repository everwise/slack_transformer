require 'slack_transformer/html/bold'
require 'slack_transformer/html/code'
require 'slack_transformer/html/italics'
require 'slack_transformer/html/lists'
require 'slack_transformer/html/preformatted'
require 'slack_transformer/html/strikethrough'
require 'slack_transformer/html/hyperlink'
require 'slack_transformer/html/line_break'
require 'slack_transformer/html/unsupported'

module SlackTransformer
  class Html
    attr_reader :input

    TRANSFORMERS = [
      SlackTransformer::Html::Bold,
      SlackTransformer::Html::Italics,
      SlackTransformer::Html::Strikethrough,
      SlackTransformer::Html::Code,
      SlackTransformer::Html::Preformatted,
      SlackTransformer::Html::Lists,
      SlackTransformer::Html::Hyperlink,
      SlackTransformer::Html::LineBreak,
      SlackTransformer::Html::Unsupported
    ]

    def initialize(input)
      @input = input
    end

    def to_slack
      TRANSFORMERS.reduce(input) do |html, transformer|
        transformer.new(html).to_slack
      end
    end
  end
end
