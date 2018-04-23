require 'nokogiri'

module SlackTransformer
  class Html
    class Lists
      attr_reader :input

      def initialize(input)
        @input = input
      end

      def to_slack
        fragment = Nokogiri::HTML.fragment(input)

        fragment.children.each do |child|
          case child.name
          when 'ul'
            list = child.children.map do |c|
              "• #{c.children.to_html}"
            end

            child.replace(list.join("\n"))
          when 'ol'
            list = child.children.map.with_index do |c, i|
              "#{i + 1}. #{c.children.to_html}"
            end

            child.replace(list.join("\n"))
          end
        end

        fragment.to_html
      end
    end
  end
end
