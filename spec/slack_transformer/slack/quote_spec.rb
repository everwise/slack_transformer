require 'slack_transformer/slack/quote'

RSpec.describe SlackTransformer::Slack::Quote do
  let(:transformation) { described_class.new(input) }

  describe '#to_html' do
    let(:input) { '>blockquote' }

    it 'replaces > with <blockquote> and </blockquote>' do
      expect(transformation.to_html).to eq('<blockquote>blockquote</blockquote>')
    end

    context "when there's nothing after the >" do
      let(:input) { '>' }

      it "doesn't replace the >" do
        expect(transformation.to_html).to eq('>')
      end
    end

    context "when there's one and only one trailing >" do
      let(:input) { '>>' }

      it 'replaces the first > with <blockquote> and </blockquote>' do
        expect(transformation.to_html).to eq('<blockquote>></blockquote>')
      end
    end

    context 'when on adjacent lines' do
      let(:input) { ">blockquote\n>blockquote" }

      it 'replaces the > with <blockquote> and </blockquote>' do
        expect(transformation.to_html).to eq('<blockquote>blockquote<br>blockquote</blockquote>')
      end
    end

    context 'when preceded by *' do
      let(:input) { '*>blockquote' }

      it "doesn't replace the >" do
        expect(transformation.to_html).to eq('*>blockquote')
      end
    end

    context 'when surrounded by *' do
      let(:input) { '*>blockquote*' }

      it 'replaces the > with <blockquote> and </blockquote>' do
        expect(transformation.to_html).to eq('*<blockquote>blockquote</blockquote>*')
      end
    end

    context 'when preceded by _' do
      let(:input) { '_>blockquote' }

      it "doesn't replace the >" do
        expect(transformation.to_html).to eq('_>blockquote')
      end
    end

    context 'when surrounded by _' do
      let(:input) { '_>blockquote_' }

      it 'replaces the > with <blockquote> and </blockquote>' do
        expect(transformation.to_html).to eq('_<blockquote>blockquote</blockquote>_')
      end
    end

    context 'when preceded by ~' do
      let(:input) { '~>blockquote' }

      it "doesn't replace the >" do
        expect(transformation.to_html).to eq('~>blockquote')
      end
    end

    context 'when surrounded by ~' do
      let(:input) { '~>blockquote~' }

      it 'replaces the > with <blockquote> and </blockquote>' do
        expect(transformation.to_html).to eq('~<blockquote>blockquote</blockquote>~')
      end
    end

    context 'when preceded by letters' do
      let(:input) { 'a>blockquote' }

      it "doesn't replace the >" do
        expect(transformation.to_html).to eq('a>blockquote')
      end
    end

    context 'when preceded by numbers' do
      let(:input) { '0>blockquote' }

      it "doesn't replace the >" do
        expect(transformation.to_html).to eq('0>blockquote')
      end
    end

    context 'when there are n >= 2 lines of >' do
      let(:input) { ">\n>" }

      it 'collapses them into n - 1 lines' do
        expect(transformation.to_html).to eq('>')
      end

      context 'when preceded by *' do
        let(:input) { "*>\n>" }

        it 'collapses them into n - 1 lines' do
          expect(transformation.to_html).to eq('*>')
        end
      end

      context 'when preceded by _' do
        let(:input) { "_>\n>" }

        it 'collapses them into n - 1 lines' do
          expect(transformation.to_html).to eq('_>')
        end
      end

      context 'when preceded by ~' do
        let(:input) { "~>\n>" }

        it 'collapses them into n - 1 lines' do
          expect(transformation.to_html).to eq('~>')
        end
      end

      context 'when preceded by letters' do
        let(:input) { "a>\n>" }

        it 'collapses them into n - 1 lines' do
          expect(transformation.to_html).to eq('a>')
        end
      end

      context 'when preceded by numbers' do
        let(:input) { "0>\n>" }

        it 'collapses them into n - 1 lines' do
          expect(transformation.to_html).to eq('0>')
        end
      end
    end
  end
end
