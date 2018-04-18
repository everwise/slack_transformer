require 'slack_transformer/html/bold'

RSpec.describe SlackTransformer::Html::Bold do
  let(:transformation) { described_class.new('<b>bold</b>') }

  describe '#to_slack' do
    it 'replaces <b> and </b> with *' do
      expect(transformation.to_slack).to eq('*bold*')
    end
  end
end
