require 'slack_transformer/slack/code'

RSpec.describe SlackTransformer::Slack::Code do
  let(:transformation) { described_class.new(input) }

  describe '#to_html' do
    let(:input) { '`code`' }

    it 'replaces ` with <code> and </code>' do
      expect(transformation.to_html).to eq('<code>code</code>')
    end

    context "when there's nothing between the `" do
      let(:input) { '``' }

      it "doesn't replace the `" do
        expect(transformation.to_html).to eq('``')
      end
    end

    context 'when there are extra leading `' do
      let(:input) { '``code`' }

      it "doesn't replace the `" do
        expect(transformation.to_html).to eq('``code`')
      end
    end

    context 'when there are 3n trailing `' do
      let(:input) { '`code```' }

      it "doesn't replace the `" do
        expect(transformation.to_html).to eq('`code```')
      end
    end

    context 'when there are 3n + 1 trailing `' do
      let(:input) { '`code````' }

      it 'replaces ` with <code> and </code>' do
        expect(transformation.to_html).to eq('<code>code```</code>')
      end
    end

    context 'when there are 3n + 2 trailing `' do
      let(:input) { '`code`````' }

      it 'replaces ` with <code> and </code>' do
        expect(transformation.to_html).to eq('<code>code```</code>`')
      end
    end

    context 'when there are extra leading and trailing ```' do
      let(:input) { '``code``' }

      it "doesn't replace the `" do
        expect(transformation.to_html).to eq('``code``')
      end
    end

    context 'when preceded by *' do
      let(:input) { '*`code`' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('*<code>code</code>')
      end
    end

    context 'when followed by *' do
      let(:input) { '`code`*' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('<code>code</code>*')
      end
    end

    context 'when surrounded by *' do
      let(:input) { '*`code`*' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('*<code>code</code>*')
      end
    end

    context 'when preceded by _' do
      let(:input) { '_`code`' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('_<code>code</code>')
      end
    end

    context 'when followed by _' do
      let(:input) { '`code`_' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('<code>code</code>_')
      end
    end

    context 'when surrounded by _' do
      let(:input) { '_`code`_' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('_<code>code</code>_')
      end
    end

    context 'when preceded by ~' do
      let(:input) { '~`code`' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('~<code>code</code>')
      end
    end

    context 'when followed by ~' do
      let(:input) { '`code`~' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('<code>code</code>~')
      end
    end

    context 'when surrounded by ~' do
      let(:input) { '~`code`~' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('~<code>code</code>~')
      end
    end

    context 'when preceded by ```' do
      let(:input) { '````code`' }

      it "doesn't replace the `" do
        expect(transformation.to_html).to eq('````code`')
      end
    end

    context 'when surrounded by ```' do
      let(:input) { '````code````' }

      it "doesn't replace the `" do
        expect(transformation.to_html).to eq('````code````')
      end
    end

    context 'when preceded by >' do
      let(:input) { '>`code`' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('><code>code</code>')
      end
    end

    context 'when preceded by >>>' do
      let(:input) { '>>>`code`' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('>>><code>code</code>')
      end
    end

    context 'when preceded by letters' do
      let(:input) { 'a`code`' }

      it "doesn't replace the `" do
        expect(transformation.to_html).to eq('a`code`')
      end
    end

    context 'when followed by letters' do
      let(:input) { '`code`z' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('<code>code</code>z')
      end
    end

    context 'when surrounded by letters' do
      let(:input) { 'a`code`z' }

      it "doesn't replace the `" do
        expect(transformation.to_html).to eq('a`code`z')
      end
    end

    context 'when preceded by numbers' do
      let(:input) { '0`code`' }

      it "doesn't replace the `" do
        expect(transformation.to_html).to eq('0`code`')
      end
    end

    context 'when followed by numbers' do
      let(:input) { '`code`9' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('<code>code</code>9')
      end
    end

    context 'when surrounded by numbers' do
      let(:input) { '0`code`9' }

      it "doesn't replace the `" do
        expect(transformation.to_html).to eq('0`code`9')
      end
    end

    context 'when there are internal spaces' do
      let(:input) { '`code code`' }

      it 'replaces the ` with <code> and </code>' do
        expect(transformation.to_html).to eq('<code>code code</code>')
      end
    end
  end
end
