require 'slack_transformer/html/hyperlink'

RSpec.describe SlackTransformer::Html::Hyperlink do
  let(:transformation) { described_class.new('<a href="http://example.com">Example</a>') }

  describe '#to_slack' do
    it 'replaces html hyperlinks with mrkdwn links' do
      expect(transformation.to_slack).to eq('<http://example.com|Example>')
    end
  end
end
