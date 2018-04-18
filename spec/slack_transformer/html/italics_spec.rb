require 'slack_transformer/html/italics'

RSpec.describe SlackTransformer::Html::Italics do
  let(:transformation) { described_class.new('<i>italics</i>') }

  describe '#to_slack' do
    it 'replaces <i> and </i> with _' do
      expect(transformation.to_slack).to eq('_italics_')
    end
  end
end
