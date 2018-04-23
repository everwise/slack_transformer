require 'slack_transformer/entities'

RSpec.describe SlackTransformer::Entities do
  describe '#to_slack' do
    it 'replaces & with &amp;' do
      expect(described_class.new('&').to_slack).to eq('&amp;')
    end

    it 'replaces < with &lt;' do
      expect(described_class.new('<').to_slack).to eq('&lt;')
    end

    it 'replaces > with &gt;' do
      expect(described_class.new('>').to_slack).to eq('&gt;')
    end
  end
end
