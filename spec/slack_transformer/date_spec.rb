require 'time'
require 'slack_transformer/date'

RSpec.describe SlackTransformer::Date do
  let(:transformation) { described_class.new(date, format: format, link: link, fallback: fallback) }
  let(:date) { Time.parse('2018-01-01T00:00:00Z') }
  let(:format) { 'format' }
  let(:link) { nil }
  let(:fallback) { 'fallback' }

  describe '#to_slack' do
    it 'replaces dates with commands' do
      expect(transformation.to_slack).to eq('<!date^1514764800^format|fallback>')
    end

    context "when there's a link" do
      let(:link) { 'link' }

      it 'replaces dates with commands' do
        expect(transformation.to_slack).to eq('<!date^1514764800^format^link|fallback>')
      end
    end

    context 'when the format contains an invalid token' do
      let(:format) { token }
      let(:token) { '{time_pretty}' }

      it 'raises an error' do
        expect { transformation.to_slack }.to raise_error(SlackTransformer::Date::InvalidTokenError, token)
      end
    end
  end
end
