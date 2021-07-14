module SlackTransformer
  class Html
    class LineBreak
      attr_reader :input

      def initialize(input)
        @input = input
      end

      def to_slack
        # TODO: Get \n to work with Slack, per their docs it should
        input.gsub(/<br>/, ' ')
      end
    end
  end
end
