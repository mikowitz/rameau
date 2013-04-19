require 'spec_helper'

describe Rameau::Piece do
  let(:c4_2) { build(:note, duration: 0.5) }
  let(:r_8) { build(:rest, duration: 0.125) }
  let(:phrase) { build_phrase(c4_2, r_8, c4_2) }

  describe 'validations' do
    it 'should require all elements to be composeable' do
      expect(build_piece(phrase, r_8)).to be_valid
      expect(build_piece(c4_2, r_8)).to be_valid
      expect(build_piece(phrase, phrase)).to be_valid
      expect(build_piece(phrase, build_piece(phrase, r_8))).to be_valid
      expect(build_piece(phrase)).to be_valid

      expect(build_piece(phrase, 'c4_2')).not_to be_valid
      expect(build_piece(phrase, nil)).not_to be_valid
      expect(build_piece(phrase, build(:pitch))).not_to be_valid
    end
  end

  def build_piece(*parts)
    Rameau::Piece.new(*parts)
  end

  def build_phrase(*args)
    Rameau::Phrase.new(args)
  end
end
