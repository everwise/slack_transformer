require 'slack_transformer/html/unsupported'

RSpec.describe SlackTransformer::Html::Unsupported do
  describe '#to_slack' do
    it 'removes unsupported HTML tags' do
      transformation = described_class.new('<div><section><fake>*bold*</fake></section></div>')
      expect(transformation.to_slack).to eq('*bold*')
    end

    it 'does not remove Slack links' do
      transformation = described_class.new('<div>*bold* <http://example.com|Example></div>')
      expect(transformation.to_slack).to eq('*bold* <http://example.com|Example>')
    end

    it 'does not remove Slack links' do
      transformation = described_class.new('<div>*bold* <http://example.com></div>')
      expect(transformation.to_slack).to eq('*bold* <http://example.com>')
    end
  end
end
