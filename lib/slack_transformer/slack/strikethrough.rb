module SlackTransformer
  class Slack
    class Strikethrough
      attr_reader :input

      PATTERN = /
        (?<=^|\W)

        # preceded by start of line or non-word character

        (?<![*~`])

        # but not *, ~, or `, which are mrkdwn delimiters
        # Note: _ is also a mrkdwn delimiter, but it's included in \W because
        # it's a word character.

        ([*_]?)

        # optionally preceded by * or _

        ~((?:[^~]|(?<=[\w\s])~+(?=\w))+)~

        # one or more of either not ~, or one or more ~ preceded by word
        # character or space and followed by word character, surrounded by ~

        \1

        # followed by * or _ if preceded by it

        (?![*`])

        # not followed by * or `

        (?=\W|$)

        # followed by non-word character or end of line
      /x

      def initialize(input)
        @input = input
      end

      def to_html
        input.gsub(PATTERN, '\1<s>\2</s>\1')
      end
    end
  end
end
