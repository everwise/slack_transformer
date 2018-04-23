require 'slack_transformer/html'

RSpec.describe SlackTransformer::Html do
  let(:transformation) { described_class.new(input) }
  let(:input) { double('input') }

  describe '#to_slack' do
    let(:bold_transformation) { instance_double('SlackTransformer::Html::Bold', to_slack: bold) }
    let(:bold) { double('bold') }
    let(:italics_transformation) { instance_double('SlackTransformer::Html::Italics', to_slack: italics) }
    let(:italics) { double('italics') }
    let(:strikethrough_transformation) { instance_double('SlackTransformer::Html::Strikethrough', to_slack: strikethrough) }
    let(:strikethrough) { double('strikethrough') }
    let(:code_transformation) { instance_double('SlackTransformer::Html::Code', to_slack: code) }
    let(:code) { double('code') }
    let(:preformatted_transformation) { instance_double('SlackTransformer::Html::Preformatted', to_slack: preformatted) }
    let(:preformatted) { double('preformatted') }
    let(:lists_transformation) { instance_double('SlackTransformer::Html::Lists', to_slack: mrkdwn) }
    let(:mrkdwn) { 'output' }

    before do
      allow(SlackTransformer::Html::Bold).to receive(:new).with(input) { bold_transformation }
      allow(SlackTransformer::Html::Italics).to receive(:new).with(bold) { italics_transformation }
      allow(SlackTransformer::Html::Strikethrough).to receive(:new).with(italics) { strikethrough_transformation }
      allow(SlackTransformer::Html::Code).to receive(:new).with(strikethrough) { code_transformation }
      allow(SlackTransformer::Html::Preformatted).to receive(:new).with(code) { preformatted_transformation }
      allow(SlackTransformer::Html::Lists).to receive(:new).with(preformatted) { lists_transformation }
    end

    it 'returns mrkdwn' do
      expect(transformation.to_slack).to eq(mrkdwn)
    end
  end
end
