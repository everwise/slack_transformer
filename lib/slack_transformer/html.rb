require 'slack_transformer/html/bold'
require 'slack_transformer/html/code'
require 'slack_transformer/html/italics'
require 'slack_transformer/html/lists'
require 'slack_transformer/html/preformatted'
require 'slack_transformer/html/strikethrough'

module SlackTransformer
  class Html
    attr_reader :input

    TRANSFORMERS = [
      SlackTransformer::Html::Bold,
      SlackTransformer::Html::Italics,
      SlackTransformer::Html::Strikethrough,
      SlackTransformer::Html::Code,
      SlackTransformer::Html::Preformatted,
      SlackTransformer::Html::Lists
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
