require 'spec_helper'

describe Rameau::Note do
  let(:c4) { build(:pitch) }
  describe 'validations' do
    it 'should require a valid pitch' do
      expect(build(:note, pitch: c4)).to be_valid
      expect(build(:note, pitch: nil)).not_to be_valid
      expect(build(:note, pitch: 'c4')).not_to be_valid
      expect(build(:note, pitch: 0)).not_to be_valid
    end

    it 'should require a positive, numeric duration' do
      expect(build(:note, duration: 1)).to be_valid
      expect(build(:note, duration: 5)).to be_valid
      expect(build(:note, duration: 1.0 / 3)).to be_valid
      expect(build(:note, duration: -1)).not_to be_valid
      expect(build(:note, duration: 0)).not_to be_valid
      expect(build(:note, duration: nil)).not_to be_valid
      expect(build(:note, duration: 'quarter note')).not_to be_valid
    end
  end

  describe '#to_s' do
    it 'should return a string representation of the form #{pitch}(#{duration})' do
      expect(build(:note, pitch: c4, duration: 1).to_s).to eq 'c4(1.000)'
      expect(build(:note, pitch: c4, duration: 1.0 / 3).to_s).to eq 'c4(0.333)'
    end
  end
end
