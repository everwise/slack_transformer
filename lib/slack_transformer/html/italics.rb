module SlackTransformer
  module Html
    class Italics
      attr_reader :input

      def initialize(input)
        @input = input
      end

      def to_slack
        input.gsub(/<\/?i>/, '_')
      end
    end
  end
end
