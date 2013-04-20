require 'spec_helper'

describe Rameau::Phrase do
  let(:c4_2) { build(:note, duration: 0.5) }
  let(:r_8) { build(:rest, duration: 0.125) }

  describe 'validations' do
    it 'should require all elements to be composeable' do
      expect(build_phrase(c4_2)).to be_valid
      expect(build_phrase(r_8)).to be_valid
      expect(build_phrase(build_phrase(r_8))).to be_valid
      expect(build_phrase(c4_2, 4)).not_to be_valid
      expect(build_phrase('c4_2')).not_to be_valid
    end
  end

  describe 'calling #new' do
    it 'can take an array or list of elements' do
      p1 =  build_phrase([c4_2, r_8])
      p2 =  build_phrase(c4_2, r_8)
      expect(p1.elements).to eq p2.elements
    end
  end

  describe '#duration' do
    it 'should return the correct duration of the entire phrase' do
      expect(build_phrase(c4_2, r_8, c4_2).duration).to eq 1.125 
    end
  end

  def build_phrase(*args)
    Rameau::Phrase.new(args)
  end
end
