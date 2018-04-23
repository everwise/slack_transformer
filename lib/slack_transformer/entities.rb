module SlackTransformer
  class Entities
    attr_reader :input

    def initialize(input)
      @input = input
    end

    # See https://api.slack.com/docs/message-formatting#how_to_escape_characters
    # NB: The order matters here. If you were to replace < with &lt; first, for
    #   example, you'd end up with &amp;lt;
    def to_slack
      input.gsub('&', '&amp;')
           .gsub('<', '&lt;')
           .gsub('>', '&gt;')
    end
  end
end
