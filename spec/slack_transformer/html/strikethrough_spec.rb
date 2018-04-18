require 'slack_transformer/html/strikethrough'

RSpec.describe SlackTransformer::Html::Strikethrough do
  let(:transformation) { described_class.new('<s>strikethrough</s>') }

  describe '#to_slack' do
    it 'replaces <s> and </s> with ~' do
      expect(transformation.to_slack).to eq('~strikethrough~')
    end
  end
end
