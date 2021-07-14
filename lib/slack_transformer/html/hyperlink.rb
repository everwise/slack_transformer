module SlackTransformer
  class Html
    class Hyperlink
      attr_reader :input

      def initialize(input)
        @input = input
      end

      def to_slack
        input.gsub /<a [^h]*href=["']([^"']*)["'][^>]*>([^<]*)<\/a>/, "<\\1|\\2>"
      end
    end
  end
end
