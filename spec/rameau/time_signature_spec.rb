require 'spec_helper'

describe Rameau::TimeSignature do
  describe 'validations' do
    it 'should require a whole, > 0 number as the number of beats' do
      expect(build(:time_signature, beats: 1)).to be_valid
      expect(build(:time_signature, beats: '4')).to be_valid
      expect(build(:time_signature, beats: 0)).not_to be_valid
      expect(build(:time_signature, beats: nil)).not_to be_valid
      expect(build(:time_signature, beats: 4.1)).not_to be_valid
      expect(build(:time_signature, beats: -2)).not_to be_valid
      expect(build(:time_signature, beats: '')).not_to be_valid
    end

    it 'should require a power of 2 as the subdivisions' do
      expect(build(:time_signature, subdivisions: 2)).to be_valid
      expect(build(:time_signature, subdivisions: 32)).to be_valid
      expect(build(:time_signature, subdivisions: 2.5)).not_to be_valid
      expect(build(:time_signature, subdivisions: 33)).not_to be_valid
      expect(build(:time_signature, subdivisions: -1)).not_to be_valid
      expect(build(:time_signature, subdivisions: 0)).not_to be_valid
    end
  end

  describe '#duration' do
    it 'should return the duration defined by the time signature' do
      expect(build(:time_signature, beats: 2, subdivisions: 4).duration).to eq 0.5
      expect(build(:time_signature, beats: 3, subdivisions: 1).duration).to eq 3.0
      expect(build(:time_signature, beats: 5, subdivisions: 8).duration).to eq 0.625
      expect(build(:time_signature, beats: 3, subdivisions: 16).duration).to eq 0.1875
    end
  end

  describe '#to_s' do
    it 'should return a string representation of the time signature' do
      expect(build(:time_signature, beats: 2, subdivisions: 4).to_s).to eq '2/4'
      expect(build(:time_signature, beats: 3, subdivisions: 1).to_s).to eq '3/1'
      expect(build(:time_signature, beats: 5, subdivisions: 8).to_s).to eq '5/8'
      expect(build(:time_signature, beats: 3, subdivisions: 16).to_s).to eq '3/16'
    end
  end
end
