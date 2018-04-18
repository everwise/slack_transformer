module SlackTransformer
  module Html
    class Code
      attr_reader :input

      def initialize(input)
        @input = input
      end

      def to_slack
        input.gsub(/<\/?code>/, '`')
      end
    end
  end
end
