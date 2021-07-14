require 'slack_transformer/html/bold'

RSpec.describe SlackTransformer::Html::Bold do
  describe '#to_slack' do
    it 'replaces <b> and </b> with *' do
      transformation = described_class.new('<b>bold</b>')
      expect(transformation.to_slack).to eq('*bold*')
    end

    it 'replaces <strong> and </strong> with *' do
      transformation = described_class.new('<strong>bold</strong>')
      expect(transformation.to_slack).to eq('*bold*')
    end
  end
end
