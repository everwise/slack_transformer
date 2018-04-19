require 'slack_transformer/slack/bold'

RSpec.describe SlackTransformer::Slack::Bold do
  let(:transformation) { described_class.new(input) }

  describe '#to_html' do
    let(:input) { '*bold*' }

    it 'replaces * with <b> and </b>' do
      expect(transformation.to_html).to eq('<b>bold</b>')
    end

    context "when there's nothing between the *" do
      let(:input) { '**' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('**')
      end
    end

    context 'when there are extra leading *' do
      let(:input) { '**bold*' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('**bold*')
      end
    end

    context 'when there are extra trailing *' do
      let(:input) { '*bold**' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('*bold**')
      end
    end

    context 'when there are extra leading and trailing *' do
      let(:input) { '**bold**' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('**bold**')
      end
    end

    context 'when preceded by _' do
      let(:input) { '_*bold*' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('_*bold*')
      end
    end

    context 'when followed by _' do
      let(:input) { '*bold*_' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('*bold*_')
      end
    end

    context 'when surrounded by _' do
      let(:input) { '_*bold*_' }

      it 'replaces * with <b> and </b>' do
        expect(transformation.to_html).to eq('_<b>bold</b>_')
      end
    end

    context 'when preceded by ~' do
      let(:input) { '~*bold*' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('~*bold*')
      end
    end

    context 'when followed by ~' do
      let(:input) { '*bold*~' }

      it 'replaces * with <b> and </b>' do
        expect(transformation.to_html).to eq('<b>bold</b>~')
      end
    end

    context 'when surrounded by ~' do
      let(:input) { '~*bold*~' }

      it 'replaces * with <b> and </b>' do
        expect(transformation.to_html).to eq('~<b>bold</b>~')
      end
    end

    context 'when preceded by `' do
      let(:input) { '`*bold*' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('`*bold*')
      end
    end

    context 'when followed by `' do
      let(:input) { '*bold*`' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('*bold*`')
      end
    end

    context 'when surrounded by `' do
      let(:input) { '`*bold*`' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('`*bold*`')
      end
    end

    context 'when preceded by ```' do
      let(:input) { '```*bold*' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('```*bold*')
      end
    end

    context 'when followed by ```' do
      let(:input) { '*bold*```' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('*bold*```')
      end
    end

    context 'when surrounded by ```' do
      let(:input) { '```*bold*```' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('```*bold*```')
      end
    end

    context 'when preceded by >' do
      let(:input) { '>*bold*' }

      it 'replaces * with <b> and </b>' do
        expect(transformation.to_html).to eq('><b>bold</b>')
      end
    end

    context 'when preceded by >>>' do
      let(:input) { '>>>*bold*' }

      it 'replaces * with <b> and </b>' do
        expect(transformation.to_html).to eq('>>><b>bold</b>')
      end
    end

    context 'when preceded by letters' do
      let(:input) { 'a*bold*' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('a*bold*')
      end
    end

    context 'when followed by letters' do
      let(:input) { '*bold*z' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('*bold*z')
      end
    end

    context 'when surrounded by letters' do
      let(:input) { 'a*bold*z' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('a*bold*z')
      end
    end

    context 'when preceded by numbers' do
      let(:input) { '0*bold*' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('0*bold*')
      end
    end

    context 'when followed by numbers' do
      let(:input) { '*bold*9' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('*bold*9')
      end
    end

    context 'when surrounded by numbers' do
      let(:input) { '0*bold*9' }

      it "doesn't replace the *" do
        expect(transformation.to_html).to eq('0*bold*9')
      end
    end

    context 'when there are internal spaces' do
      let(:input) { '*bold bold*' }

      it 'replaces the * with <b> and </b>' do
        expect(transformation.to_html).to eq('<b>bold bold</b>')
      end
    end

    context 'when there are internal sequences of *' do
      let(:input) { '*bold*bold*' }

      it 'replaces the outer * with <b> and </b>' do
        expect(transformation.to_html).to eq('<b>bold*bold</b>')
      end
    end

    context 'when there are internal sequences of * preceded by spaces' do
      let(:input) { '*bold *bold*' }

      it 'replaces the outer * with <b> and </b>' do
        expect(transformation.to_html).to eq('<b>bold *bold</b>')
      end
    end
  end
end
