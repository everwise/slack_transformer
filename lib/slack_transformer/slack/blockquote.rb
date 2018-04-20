module SlackTransformer
  module Slack
    class Blockquote
      attr_reader :input

      PATTERN = /
        ^

        # start of line

        ([*_~]?)

        # optionally preceded by *, _, or ~

        >{3}(.+)

        # one or more of anything preceded by >

        \1

        # followed by *, _, or ~ if preceded by it

        $

        # end of line
      /mx

      def initialize(input)
        @input = input
      end

      def to_html
        input.gsub(PATTERN) do
          outer = Regexp.last_match(1)
          inner = Regexp.last_match(2).gsub("\n", '<br>')

          "#{outer}<blockquote>#{inner}</blockquote>#{outer}"
        end
      end
    end
  end
end
