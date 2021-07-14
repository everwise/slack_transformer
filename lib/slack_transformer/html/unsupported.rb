module SlackTransformer
  class Html
    class Unsupported
      attr_reader :input

      def initialize(input)
        @input = input
      end

      def to_slack
        # Filter out all remaining < > tags except for Slack links (<http://url|text> or <http://url>)
        input.gsub(/<(.[^http][^|]*?)>/, '')
      end
    end
  end
end
