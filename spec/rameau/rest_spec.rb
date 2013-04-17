require 'spec_helper'

describe Rameau::Rest do
  describe 'validations' do
    it 'should require a positive, numeric duration' do
      expect(build(:rest, duration: 1)).to be_valid
      expect(build(:rest, duration: 5)).to be_valid
      expect(build(:rest, duration: 1.0 / 3)).to be_valid
      expect(build(:rest, duration: -1)).not_to be_valid
      expect(build(:rest, duration: 0)).not_to be_valid
      expect(build(:rest, duration: nil)).not_to be_valid
      expect(build(:rest, duration: 'quarter note')).not_to be_valid
    end
  end

  describe '#to_s' do
    it 'should return a string representation of the form #{pitch}(#{duration})' do
      expect(build(:rest, duration: 1).to_s).to eq 'r(1.000)'
      expect(build(:rest, duration: 2.0 / 3).to_s).to eq 'r(0.667)'
    end
  end
end
