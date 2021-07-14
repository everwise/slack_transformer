module SlackTransformer
  class Html
    class Strikethrough
      attr_reader :input

      def initialize(input)
        @input = input
      end

      def to_slack
        input.gsub(/<\/?(s|del)>/, '~')
      end
    end
  end
end
