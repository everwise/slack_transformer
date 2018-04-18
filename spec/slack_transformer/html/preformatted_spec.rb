require 'slack_transformer/html/preformatted'

RSpec.describe SlackTransformer::Html::Preformatted do
  let(:transformation) { described_class.new('<pre>preformatted</pre>') }

  describe '#to_slack' do
    it 'replaces <pre> and </pre> with ```' do
      expect(transformation.to_slack).to eq('```preformatted```')
    end
  end
end
