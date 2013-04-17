require 'spec_helper'

describe Rameau::Composeable do
  let(:c4_2) { build(:note, duration: 0.5) }
  let(:c4_4) { build(:note, duration: 0.25) }
  let(:r_8) { build(:rest, duration: 0.125) }

  describe 'serial composition' do
    before do
      @phrase = c4_2 + r_8 + c4_4 + r_8
    end

    it 'should be possible' do
      expect(@phrase.duration).to eq 1
      expect(@phrase).to be_a Rameau::Phrase
    end

    describe '#to_s' do
      it 'should return a string representation of the elements of the phrase' do
        expect(@phrase.to_s).to eq "c4(0.500) r(0.125) c4(0.250) r(0.125)"
      end
    end
  end
end