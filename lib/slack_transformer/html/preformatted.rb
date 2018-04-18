module SlackTransformer
  module Html
    class Preformatted
      attr_reader :input

      def initialize(input)
        @input = input
      end

      def to_slack
        input.gsub(/<\/?pre>/, '```')
      end
    end
  end
end
