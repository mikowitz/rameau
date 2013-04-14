require 'spec_helper'

describe Rameau::Pitch do
  describe 'validations' do
    it 'should require a valid pitch class' do
      expect(build(:pitch, pitch_class: build(:pitch_class))).to be_valid
      expect(build(:pitch, pitch_class: nil)).not_to be_valid
      expect(build(:pitch, pitch_class: '')).not_to be_valid
      expect(build(:pitch, pitch_class: 'c')).not_to be_valid
    end

    it 'should require a positive numeric octave' do
      expect(build(:pitch, octave: 3)).to be_valid
      expect(build(:pitch, octave: 0)).to be_valid
      expect(build(:pitch, octave: -1)).not_to be_valid
      expect(build(:pitch, octave: nil)).not_to be_valid
      expect(build(:pitch, octave: '')).not_to be_valid
      expect(build(:pitch, octave: '4')).to be_valid
      expect(build(:pitch, octave: '4.1')).not_to be_valid
    end
  end

  describe 'equality' do
    it 'should allow pitches to be compared according to octave and pitch degree' do
      expect(pitch_of_pitch_class(3)).to be > pitch_of_pitch_class(2) 
      expect(pitch_of_pitch_class(1, 4)).to be > pitch_of_pitch_class(11, 3)
    end

    it 'should recognize enharmonic equivalence' do
      cs4 = pitch_of_pitch_class(0).sharp
      df4 = pitch_of_pitch_class(2).flat

      expect(cs4).to eq df4
    end

    it 'should recognize enharmonic equivalence across octaves' do
      cf4 = pitch_of_pitch_class(0).flat
      b3 = pitch_of_pitch_class(11, 3)
      
      expect(cf4).to eq b3
    end
  end

  describe '#to_s' do
    it 'should return a string representation of the pitch' do
      expect(pitch_of_pitch_class(0).to_s).to eq 'c4'
      expect(pitch_of_pitch_class(4, 3).flat.to_s).to eq 'ef3'
    end
  end

  def pitch_of_pitch_class(natural_degree, octave=4)
    build( :pitch, pitch_class: build(:pitch_class, natural_degree: natural_degree), octave: octave)
  end
end
