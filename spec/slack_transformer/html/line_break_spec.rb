require 'slack_transformer/html/line_break'

RSpec.describe SlackTransformer::Html::LineBreak do
  let(:transformation) { described_class.new('a line of text<br>') }

  describe '#to_slack' do
    it 'replaces <br> with negative space' do
      expect(transformation.to_slack).to eq('a line of text ')
    end
  end
end
