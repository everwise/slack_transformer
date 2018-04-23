require 'slack_transformer/slack'

RSpec.describe SlackTransformer::Slack do
  let(:transformation) { described_class.new(input) }
  let(:input) { double('input') }

  describe '#to_html' do
    let(:bold_transformation) { instance_double('SlackTransformer::Slack::Bold', to_html: bold) }
    let(:bold) { double('bold') }
    let(:italics_transformation) { instance_double('SlackTransformer::Slack::Italics', to_html: italics) }
    let(:italics) { double('italics') }
    let(:strikethrough_transformation) { instance_double('SlackTransformer::Slack::Strikethrough', to_html: strikethrough) }
    let(:strikethrough) { double('strikethrough') }
    let(:code_transformation) { instance_double('SlackTransformer::Slack::Code', to_html: code) }
    let(:code) { double('code') }
    let(:preformatted_transformation) { instance_double('SlackTransformer::Slack::Preformatted', to_html: preformatted) }
    let(:preformatted) { double('preformatted') }
    let(:quote_transformation) { instance_double('SlackTransformer::Slack::Quote', to_html: quote) }
    let(:quote) { double('quote') }
    let(:blockquote_transformation) { instance_double('SlackTransformer::Slack::Blockquote', to_html: html) }
    let(:html) { 'output' }

    before do
      allow(SlackTransformer::Slack::Bold).to receive(:new).with(input) { bold_transformation }
      allow(SlackTransformer::Slack::Italics).to receive(:new).with(bold) { italics_transformation }
      allow(SlackTransformer::Slack::Strikethrough).to receive(:new).with(italics) { strikethrough_transformation }
      allow(SlackTransformer::Slack::Code).to receive(:new).with(strikethrough) { code_transformation }
      allow(SlackTransformer::Slack::Preformatted).to receive(:new).with(code) { preformatted_transformation }
      allow(SlackTransformer::Slack::Quote).to receive(:new).with(preformatted) { quote_transformation }
      allow(SlackTransformer::Slack::Blockquote).to receive(:new).with(quote) { blockquote_transformation }
    end

    it 'returns HTML' do
      expect(transformation.to_html).to eq('<p>output</p>')
    end

    context 'when there are newlines' do
      let(:html) { "\n" }

      it 'replaces the newlines with line breaks' do
        expect(transformation.to_html).to eq('<p><br></p>')
      end
    end
  end
end
