require 'set'
require 'time'

module SlackTransformer
  class Date
    attr_reader :input, :format, :link, :fallback

    class InvalidTokenError < StandardError; end

    # See https://api.slack.com/docs/message-formatting#formatting_dates
    DATE_FORMAT_TOKENS = Set.new(%w[
      {date_num}
      {date}
      {date_short}
      {date_long}
      {date_pretty}
      {date_short_pretty}
      {date_long_pretty}
      {time}
      {time_secs}
    ])

    def initialize(input, format:, link: nil, fallback:)
      @input = input
      @format = format
      @link = link
      @fallback = fallback
    end

    def to_slack
      tokens = format.scan(/(\{\w+\})/).first

      if tokens
        invalid_tokens = tokens.reject { |t| DATE_FORMAT_TOKENS.include?(t) }
        raise InvalidTokenError, invalid_tokens.join(', ') unless invalid_tokens.empty?
      end

      "<!date^#{Time.parse(input.to_s).to_i}^#{format}#{"^#{link}" if link}|#{fallback}>"
    end
  end
end
