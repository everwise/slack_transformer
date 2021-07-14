module SlackTransformer
  class Html
    class Bold
      attr_reader :input

      def initialize(input)
        @input = input
      end

      def to_slack
        input.gsub(/<\/?(b|strong)>/, '*')
      end
    end
  end
end
