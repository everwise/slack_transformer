require 'slack_transformer/html/code'

RSpec.describe SlackTransformer::Html::Code do
  let(:transformation) { described_class.new('<code>code</code>') }

  describe '#to_slack' do
    it 'replaces <code> and </code> with `' do
      expect(transformation.to_slack).to eq('`code`')
    end
  end
end
