require 'spec_helper'

describe Rameau::PitchClass do
  def c; build(:pitch_class, natural_degree: 0); end
  def d; build(:pitch_class, natural_degree: 2); end

  describe 'validations' do
    it 'should only allow the natural pitch degrees between 0 and 11 (with 0 = c)' do
      expect(build(:pitch_class, natural_degree: -1)).not_to be_valid
      expect(build(:pitch_class, natural_degree: 0)).to be_valid
      expect(build(:pitch_class, natural_degree: 1)).not_to be_valid
      expect(build(:pitch_class, natural_degree: 2)).to be_valid
      expect(build(:pitch_class, natural_degree: 3)).not_to be_valid
      expect(build(:pitch_class, natural_degree: 4)).to be_valid
      expect(build(:pitch_class, natural_degree: 5)).to be_valid
      expect(build(:pitch_class, natural_degree: 6)).not_to be_valid
      expect(build(:pitch_class, natural_degree: 7)).to be_valid
      expect(build(:pitch_class, natural_degree: 8)).not_to be_valid
      expect(build(:pitch_class, natural_degree: 9)).to be_valid
      expect(build(:pitch_class, natural_degree: 10)).not_to be_valid
      expect(build(:pitch_class, natural_degree: 11)).to be_valid
      expect(build(:pitch_class, natural_degree: 12)).not_to be_valid
    end
  end
  
  describe 'equality' do
    it 'should allow pitch classes to be sorted according to pitch degree' do
      e = build(:pitch_class, natural_degree: 4)
      c2 = build(:pitch_class, natural_degree: 0)

      expect(c).to eq c2
      expect(d).to be > c
      expect(d).to be < e
    end
  end

  describe 'accidentals' do
    it 'should allow sharping and flatting notes' do
      expect(c.to_i).to eq 0
      expect(c.sharp.to_i).to eq 1
      expect(c.flat.to_i).to eq 11
      expect(c.sharp.sharp.to_i).to eq 2
    end
  end

  it 'should recognize enharmonic equivalence' do
    expect(c.sharp).to eq d.flat
    expect(c.natural.sharp.sharp).to eq d.natural
  end

  describe '#to_s' do
    it 'should return a string representation of the pitch class' do
      expect(c.to_s).to eq 'c'
      expect(c.sharp.to_s).to eq 'cs'
      expect(c.sharp.sharp.to_s).to eq 'css'
      expect(c.flat.to_s).to eq 'cf'
      expect(c.sharp.sharp.flat.to_s).to eq 'cs'
    end
  end
end
