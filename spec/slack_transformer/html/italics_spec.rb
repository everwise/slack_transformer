require 'slack_transformer/html/italics'

RSpec.describe SlackTransformer::Html::Italics do
  describe '#to_slack' do
    it 'replaces <i> and </i> with _' do
      transformation = described_class.new('<i>italics</i>')
      expect(transformation.to_slack).to eq('_italics_')
    end

    it 'replaces <em> and </em> with _' do
      transformation = described_class.new('<em>italics</em>')
      expect(transformation.to_slack).to eq('_italics_')
    end
  end
end
