module SlackTransformer
  module Slack
    class Quote
      attr_reader :input

      PATTERN = /
        ^

        # start of line

        ([*_~]?)

        # optionally preceded by *, _, or ~

        >(.+?)

        # one or more of anything preceded by >

        \1

        # followed by *, _, or ~ if preceded by it

        (?:\n|$)

        # followed by newline or end of line
      /x

      def initialize(input)
        @input = input
      end

      def to_html
        input.gsub(PATTERN, '\1<blockquote>\2</blockquote>\1')
             .gsub('</blockquote><blockquote>', '<br>')
             .gsub(/(>(?:\n|$)){2,}/) { |match| match[0...-2] }
      end
    end
  end
end
