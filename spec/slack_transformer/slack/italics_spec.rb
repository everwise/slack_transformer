require 'slack_transformer/slack/italics'

RSpec.describe SlackTransformer::Slack::Italics do
  let(:transformation) { described_class.new(input) }

  describe '#to_html' do
    let(:input) { '_italics_' }

    it 'replaces _ with <i> and </i>' do
      expect(transformation.to_html).to eq('<i>italics</i>')
    end

    context "when there's nothing between the _" do
      let(:input) { '__' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('__')
      end
    end

    context 'when there are extra leading _' do
      let(:input) { '__italics_' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('__italics_')
      end
    end

    context 'when there are extra trailing _' do
      let(:input) { '_italics__' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('_italics__')
      end
    end

    context 'when there are extra leading and trailing _' do
      let(:input) { '__italics__' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('__italics__')
      end
    end

    context 'when preceded by *' do
      let(:input) { '*_italics_' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('*_italics_')
      end
    end

    context 'when followed by *' do
      let(:input) { '_italics_*' }

      it 'replaces _ with <i> and </i>' do
        expect(transformation.to_html).to eq('<i>italics</i>*')
      end
    end

    context 'when surrounded by *' do
      let(:input) { '*_italics_*' }

      it 'replaces _ with <i> and </i>' do
        expect(transformation.to_html).to eq('*<i>italics</i>*')
      end
    end

    context 'when preceded by ~' do
      let(:input) { '~_italics_' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('~_italics_')
      end
    end

    context 'when followed by ~' do
      let(:input) { '_italics_~' }

      it 'replaces _ with <i> and </i>' do
        expect(transformation.to_html).to eq('<i>italics</i>~')
      end
    end

    context 'when surrounded by ~' do
      let(:input) { '~_italics_~' }

      it 'replaces _ with <i> and </i>' do
        expect(transformation.to_html).to eq('~<i>italics</i>~')
      end
    end

    context 'when preceded by `' do
      let(:input) { '`_italics_' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('`_italics_')
      end
    end

    context 'when followed by `' do
      let(:input) { '_italics_`' }

      it 'replaces _ with <i> and </i>' do
        expect(transformation.to_html).to eq('<i>italics</i>`')
      end
    end

    context 'when surrounded by `' do
      let(:input) { '`_italics_`' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('`_italics_`')
      end
    end

    context 'when preceded by ```' do
      let(:input) { '```_italics_' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('```_italics_')
      end
    end

    context 'when followed by ```' do
      let(:input) { '_italics_```' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('_italics_```')
      end
    end

    context 'when surrounded by ```' do
      let(:input) { '```_italics_```' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('```_italics_```')
      end
    end

    context 'when preceded by >' do
      let(:input) { '>_italics_' }

      it 'replaces _ with <i> and </i>' do
        expect(transformation.to_html).to eq('><i>italics</i>')
      end
    end

    context 'when preceded by >>>' do
      let(:input) { '>>>_italics_' }

      it 'replaces _ with <i> and </i>' do
        expect(transformation.to_html).to eq('>>><i>italics</i>')
      end
    end

    context 'when preceded by letters' do
      let(:input) { 'a_italics_' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('a_italics_')
      end
    end

    context 'when followed by letters' do
      let(:input) { '_italics_z' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('_italics_z')
      end
    end

    context 'when surrounded by letters' do
      let(:input) { 'a_italics_z' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('a_italics_z')
      end
    end

    context 'when preceded by numbers' do
      let(:input) { '0_italics_' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('0_italics_')
      end
    end

    context 'when followed by numbers' do
      let(:input) { '_italics_9' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('_italics_9')
      end
    end

    context 'when surrounded by numbers' do
      let(:input) { '0_italics_9' }

      it "doesn't replace the _" do
        expect(transformation.to_html).to eq('0_italics_9')
      end
    end

    context 'when there are internal spaces' do
      let(:input) { '_italics italics_' }

      it 'replaces the _ with <i> and </i>' do
        expect(transformation.to_html).to eq('<i>italics italics</i>')
      end
    end

    context 'when there are internal sequences of _' do
      let(:input) { '_italics_italics_' }

      it 'replaces the outer _ with <i> and </i>' do
        expect(transformation.to_html).to eq('<i>italics_italics</i>')
      end
    end

    context 'when there are internal sequences of * preceded by spaces' do
      let(:input) { '_italics _italics_' }

      it 'replaces the outer _ with <i> and </i>' do
        expect(transformation.to_html).to eq('<i>italics _italics</i>')
      end
    end
  end
end
