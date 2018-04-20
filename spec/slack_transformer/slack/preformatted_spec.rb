require 'slack_transformer/slack/preformatted'

RSpec.describe SlackTransformer::Slack::Preformatted do
  let(:transformation) { described_class.new(input) }

  describe '#to_html' do
    let(:input) { '```preformatted```' }

    it 'replaces ``` with <pre> and </pre>' do
      expect(transformation.to_html).to eq('<pre>preformatted</pre>')
    end

    context "when there's nothing between the ```" do
      let(:input) { '``````' }

      it "doesn't replace the ```" do
        expect(transformation.to_html).to eq('``````')
      end
    end

    context 'when there are extra leading ```' do
      let(:input) { '``````preformatted```' }

      it 'replaces the outer ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('<pre>```preformatted</pre>')
      end
    end

    context 'when there are extra trailing ```' do
      let(:input) { '```preformatted``````' }

      it 'replaces the outer ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('<pre>preformatted```</pre>')
      end
    end

    context 'when there are extra leading and trailing ```' do
      let(:input) { '``````preformatted``````' }

      it 'replaces the outer ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('<pre>```preformatted```</pre>')
      end
    end

    context 'when preceded by *' do
      let(:input) { '*```preformatted```' }

      it 'replaces the ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('*<pre>preformatted</pre>')
      end
    end

    context 'when followed by *' do
      let(:input) { '```preformatted```*' }

      it 'replaces the ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('<pre>preformatted</pre>*')
      end
    end

    context 'when surrounded by *' do
      let(:input) { '*```preformatted```*' }

      it 'replaces the ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('*<pre>preformatted</pre>*')
      end
    end

    context 'when preceded by _' do
      let(:input) { '_```preformatted```' }

      it 'replaces the ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('_<pre>preformatted</pre>')
      end
    end

    context 'when followed by _' do
      let(:input) { '```preformatted```_' }

      it 'replaces the ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('<pre>preformatted</pre>_')
      end
    end

    context 'when surrounded by _' do
      let(:input) { '_```preformatted```_' }

      it 'replaces the ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('_<pre>preformatted</pre>_')
      end
    end

    context 'when preceded by ~' do
      let(:input) { '~```preformatted```' }

      it "doesn't replace the ```" do
        expect(transformation.to_html).to eq('~```preformatted```')
      end
    end

    context 'when followed by ~' do
      let(:input) { '```preformatted```~' }

      it "doesn't replace the ```" do
        expect(transformation.to_html).to eq('```preformatted```~')
      end
    end

    context 'when surrounded by ~' do
      let(:input) { '~```preformatted```~' }

      it 'replaces the ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('~<pre>preformatted</pre>~')
      end
    end

    context 'when preceded by `' do
      let(:input) { '````preformatted```' }

      it 'replaces the outer ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('<pre>`preformatted</pre>')
      end
    end

    context 'when followed by `' do
      let(:input) { '```preformatted````' }

      it 'replaces the outer ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('<pre>preformatted`</pre>')
      end
    end

    context 'when surrounded by `' do
      let(:input) { '````preformatted````' }

      it 'replaces the outer ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('<pre>`preformatted`</pre>')
      end
    end

    context 'when preceded by >' do
      let(:input) { '>```preformatted```' }

      it 'replaces the ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('><pre>preformatted</pre>')
      end
    end

    context 'when preceded by >>>' do
      let(:input) { '>>>```preformatted```' }

      it 'replaces the ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('>>><pre>preformatted</pre>')
      end
    end

    context 'when preceded by letters' do
      let(:input) { 'a```preformatted```' }

      it "doesn't replace the ```" do
        expect(transformation.to_html).to eq('a```preformatted```')
      end
    end

    context 'when followed by letters' do
      let(:input) { '```preformatted```z' }

      it "doesn't replace the ```" do
        expect(transformation.to_html).to eq('```preformatted```z')
      end
    end

    context 'when surrounded by letters' do
      let(:input) { 'a```preformatted```z' }

      it "doesn't replace the ```" do
        expect(transformation.to_html).to eq('a```preformatted```z')
      end
    end

    context 'when preceded by numbers' do
      let(:input) { '0```preformatted```' }

      it "doesn't replace the ```" do
        expect(transformation.to_html).to eq('0```preformatted```')
      end
    end

    context 'when followed by numbers' do
      let(:input) { '```preformatted```9' }

      it "doesn't replace the ```" do
        expect(transformation.to_html).to eq('```preformatted```9')
      end
    end

    context 'when surrounded by numbers' do
      let(:input) { '0```preformatted```9' }

      it "doesn't replace the ```" do
        expect(transformation.to_html).to eq('0```preformatted```9')
      end
    end

    context 'when there are internal spaces' do
      let(:input) { '```preformatted preformatted```' }

      it 'replaces the ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('<pre>preformatted preformatted</pre>')
      end
    end

    context 'when there are internal sequences of ```' do
      let(:input) { '```preformatted```preformatted```' }

      it 'replaces the outer ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('<pre>preformatted```preformatted</pre>')
      end
    end

    context 'when there are internal sequences of ``` preceded by spaces' do
      let(:input) { '```preformatted ```preformatted```' }

      it 'replaces the outer ``` with <pre> and </pre>' do
        expect(transformation.to_html).to eq('<pre>preformatted ```preformatted</pre>')
      end
    end
  end
end
