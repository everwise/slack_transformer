module SlackTransformer
  class Html
    class Strikethrough
      attr_reader :input

      def initialize(input)
        @input = input
      end

      def to_slack
        input.gsub(/<\/?s>/, '~')
      end
    end
  end
end
