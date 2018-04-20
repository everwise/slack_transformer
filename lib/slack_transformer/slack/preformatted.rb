module SlackTransformer
  module Slack
    class Preformatted
      attr_reader :input

      PATTERN = /
        (?<=^|\W|_)

        # preceded by start of line, non-word character, or _

        (?<!~)

        # but not ~

        ([*_~]?)

        # optionally preceded by *, _, or ~

        ```(.+)```

        # one or more of anything surrounded by ```

        \1

        # followed by *, _, or ~ if preceded by it

        (?!~)

        # not followed by ~

        (?=\W|_|$)

        # followed by non-word character, _, or end of line
      /x

      def initialize(input)
        @input = input
      end

      def to_html
        input.gsub(PATTERN, '\1<pre>\2</pre>\1')
      end
    end
  end
end
