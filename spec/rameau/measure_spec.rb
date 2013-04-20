require 'spec_helper'

describe Rameau::Measure do
  let(:c4_4) { build(:note, duration: 0.25) }
  let(:r_4) { build(:rest, duration: 0.25) }
  let(:measure) { build(:measure, time_signature: build(:time_signature, beats: 4, subdivisions: 4), contents: [c4_4]) }
  describe 'validations' do
    it 'should require a valid time signature' do
      expect(build(:measure, time_signature: build(:time_signature))).to be_valid
      expect(build(:measure, time_signature: '2/4')).not_to be_valid
      expect(build(:measure, time_signature: [2, 4])).not_to be_valid
    end
  end

  describe 'contents' do
    it 'should be instantiated from the 2nd..nth params' do
      expect(build(:measure, contents: [c4_4, r_4, c4_4]).contents.to_s).to eq 'c4(0.250) r(0.250) c4(0.250)'
    end

    it 'should be able to be added to' do
      expect((measure << r_4 << c4_4).contents.to_s).to eq 'c4(0.250) r(0.250) c4(0.250)'
    end

    it 'should raise an error if trying to add non-composeable content' do
      expect{measure << 'r_4'}.to raise_error(Rameau::NonComposeableElement)
    end
  end

  describe '#to_s' do
    it 'should return a string representation of the measure' do
      expect(measure.to_s).to eq '4/4) c4(0.250) [underfilled by 0.750]'
      measure << r_4 << c4_4 << r_4
      expect(measure.to_s).to eq '4/4) c4(0.250) r(0.250) c4(0.250) r(0.250)'
      measure << c4_4
      expect(measure.to_s).to eq '4/4) c4(0.250) r(0.250) c4(0.250) r(0.250) c4(0.250) [overfilled by 0.250]'
    end
  end
end
