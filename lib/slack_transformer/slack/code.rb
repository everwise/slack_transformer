module SlackTransformer
  class Slack
    class Code
      attr_reader :input

      PATTERN = /
        (?<=^|\W|_)

        # preceded by start of line, non-word character, or _

        (?<!`)

        # but not `

        `([^`]+?)(`+)

        # one or more of not ` preceded by ` followed by one or more `
      /x

      def initialize(input)
        @input = input
      end

      def to_html
        input.gsub(PATTERN) do |match|
          closing_backticks = Regexp.last_match(2)
          closing_backticks_length = closing_backticks.length
          closing_backticks_remainder = closing_backticks_length % 3

          if closing_backticks_remainder == 0
            match
          else
            inner_text = Regexp.last_match(1)
            inner_trailing_backticks = '`' * (closing_backticks_length / 3 * 3)
            outer_trailing_backticks = '`' * (closing_backticks_remainder - 1)

            "<code>#{inner_text}#{inner_trailing_backticks}</code>#{outer_trailing_backticks}"
          end
        end
      end
    end
  end
end
