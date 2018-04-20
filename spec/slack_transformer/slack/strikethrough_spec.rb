require 'slack_transformer/slack/strikethrough'

RSpec.describe SlackTransformer::Slack::Strikethrough do
  let(:transformation) { described_class.new(input) }

  describe '#to_html' do
    let(:input) { '~strikethrough~' }

    it 'replaces ~ with <s> and </s>' do
      expect(transformation.to_html).to eq('<s>strikethrough</s>')
    end

    context "when there's nothing between the ~" do
      let(:input) { '~~' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('~~')
      end
    end

    context 'when there are extra leading ~' do
      let(:input) { '~~strikethrough~' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('~~strikethrough~')
      end
    end

    context 'when there are extra trailing ~' do
      let(:input) { '~strikethrough~~' }

      it 'replaces ~ with <s> and </s>' do
        expect(transformation.to_html).to eq('<s>strikethrough</s>~')
      end
    end

    context 'when there are extra leading and trailing ~' do
      let(:input) { '~~strikethrough~~' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('~~strikethrough~~')
      end
    end

    context 'when preceded by *' do
      let(:input) { '*~strikethrough~' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('*~strikethrough~')
      end
    end

    context 'when followed by *' do
      let(:input) { '~strikethrough~*' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('~strikethrough~*')
      end
    end

    context 'when surrounded by *' do
      let(:input) { '*~strikethrough~*' }

      it 'replaces ~ with <s> and </s>' do
        expect(transformation.to_html).to eq('*<s>strikethrough</s>*')
      end
    end

    context 'when preceded by _' do
      let(:input) { '_~strikethrough~' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('_~strikethrough~')
      end
    end

    context 'when followed by _' do
      let(:input) { '~strikethrough~_' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('~strikethrough~_')
      end
    end

    context 'when surrounded by _' do
      let(:input) { '_~strikethrough~_' }

      it 'replaces ~ with <s> and </s>' do
        expect(transformation.to_html).to eq('_<s>strikethrough</s>_')
      end
    end

    context 'when preceded by `' do
      let(:input) { '`~strikethrough~' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('`~strikethrough~')
      end
    end

    context 'when followed by `' do
      let(:input) { '~strikethrough~`' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('~strikethrough~`')
      end
    end

    context 'when surrounded by `' do
      let(:input) { '`~strikethrough~`' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('`~strikethrough~`')
      end
    end

    context 'when preceded by ```' do
      let(:input) { '```~strikethrough~' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('```~strikethrough~')
      end
    end

    context 'when followed by ```' do
      let(:input) { '~strikethrough~```' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('~strikethrough~```')
      end
    end

    context 'when surrounded by ```' do
      let(:input) { '```~strikethrough~```' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('```~strikethrough~```')
      end
    end

    context 'when preceded by >' do
      let(:input) { '>~strikethrough~' }

      it 'replaces ~ with <s> and </s>' do
        expect(transformation.to_html).to eq('><s>strikethrough</s>')
      end
    end

    context 'when preceded by >>>' do
      let(:input) { '>>>~strikethrough~' }

      it 'replaces ~ with <s> and </s>' do
        expect(transformation.to_html).to eq('>>><s>strikethrough</s>')
      end
    end

    context 'when preceded by letters' do
      let(:input) { 'a~strikethrough~' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('a~strikethrough~')
      end
    end

    context 'when followed by letters' do
      let(:input) { '~strikethrough~z' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('~strikethrough~z')
      end
    end

    context 'when surrounded by letters' do
      let(:input) { 'a~strikethrough~z' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('a~strikethrough~z')
      end
    end

    context 'when preceded by numbers' do
      let(:input) { '0~strikethrough~' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('0~strikethrough~')
      end
    end

    context 'when followed by numbers' do
      let(:input) { '~strikethrough~9' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('~strikethrough~9')
      end
    end

    context 'when surrounded by numbers' do
      let(:input) { '0~strikethrough~9' }

      it "doesn't replace the ~" do
        expect(transformation.to_html).to eq('0~strikethrough~9')
      end
    end

    context 'when there are internal spaces' do
      let(:input) { '~strikethrough strikethrough~' }

      it 'replaces the ~ with <s> and </s>' do
        expect(transformation.to_html).to eq('<s>strikethrough strikethrough</s>')
      end
    end

    context 'when there are internal sequences of ~' do
      let(:input) { '~strikethrough~strikethrough~' }

      it 'replaces the outer ~ with <s> and </s>' do
        expect(transformation.to_html).to eq('<s>strikethrough~strikethrough</s>')
      end
    end

    context 'when there are internal sequences of * preceded by spaces' do
      let(:input) { '~strikethrough ~strikethrough~' }

      it 'replaces the outer ~ with <s> and </s>' do
        expect(transformation.to_html).to eq('<s>strikethrough ~strikethrough</s>')
      end
    end
  end
end

