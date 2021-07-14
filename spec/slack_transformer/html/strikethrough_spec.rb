require 'slack_transformer/html/strikethrough'

RSpec.describe SlackTransformer::Html::Strikethrough do
  describe '#to_slack' do
    it 'replaces <s> and </s> with ~' do
      transformation = described_class.new('<s>strikethrough</s>')
      expect(transformation.to_slack).to eq('~strikethrough~')
    end

    it 'replaces <s> and </s> with ~' do
      transformation = described_class.new('<del>strikethrough</del>')
      expect(transformation.to_slack).to eq('~strikethrough~')
    end
  end
end
