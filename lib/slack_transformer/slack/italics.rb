module SlackTransformer
  class Slack
    class Italics
      attr_reader :input

      PATTERN = /
        (?<=^|\W)

        # preceded by start of line or non-word character

        (?<![*~`])

        # but not *, ~, or `, which are mrkdwn delimiters
        # Note: _ is also a mrkdwn delimiter, but it's included in \W because
        # it's a word character.

        ([*~]?)

        # optionally preceded by * or ~

        _((?:[^_]|(?<=[a-zA-Z0-9\s])_+(?=[a-zA-Z0-9]))+)_

        # one or more of either not _, or one or more _ preceded by letter,
        # number, or space and followed by letter or number, surrounded by _

        \1

        # followed by * or ~ if preceded by it

        (?!```)

        # not followed by ```

        (?=\W|$)

        # followed by non-word character or end of line
      /x

      def initialize(input)
        @input = input
      end

      def to_html
        input.gsub(PATTERN, '\1<i>\2</i>\1')
      end
    end
  end
end
