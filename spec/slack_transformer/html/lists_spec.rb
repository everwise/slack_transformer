require 'slack_transformer/html/lists'

RSpec.describe SlackTransformer::Html::Lists do
  let(:transformation) { described_class.new(input) }

  describe '#to_slack' do
    context 'when a list is unordered' do
      let(:input) { '<ul><li>foo</li><li>bar</li><li>baz</li></ul>' }

      it 'replaces the list' do
        expect(transformation.to_slack).to eq("• foo\n• bar\n• baz")
      end
    end

    context 'when a list is ordered' do
      let(:input) { '<ol><li>foo</li><li>bar</li><li>baz</li></ol>' }

      it 'replaces the list' do
        expect(transformation.to_slack).to eq("1. foo\n2. bar\n3. baz")
      end
    end
  end
end
