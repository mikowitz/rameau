require 'spec_helper'

describe Rameau::Voices do
  let(:c4_2) { build(:note, duration: 0.5) }
  let(:r_8) { build(:rest, duration: 0.125) }
  let(:phrase) { build_phrase(c4_2, r_8, c4_2) }

  describe 'validations' do
    it 'should require all elements to be composeable' do
      expect(build_voice(phrase, r_8)).to be_valid
      expect(build_voice(c4_2, r_8)).to be_valid
      expect(build_voice(phrase, phrase)).to be_valid
      expect(build_voice(phrase, build_voice(phrase, r_8))).to be_valid
      expect(build_voice(phrase)).to be_valid

      expect(build_voice(phrase, 'c4_2')).not_to be_valid
      expect(build_voice(phrase, nil)).not_to be_valid
      expect(build_voice(phrase, build(:pitch))).not_to be_valid
    end
  end

  def build_voice(*parts)
    Rameau::Voices.new(*parts)
  end

  def build_phrase(*args)
    Rameau::Phrase.new(args)
  end
end
