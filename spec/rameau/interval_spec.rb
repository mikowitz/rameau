require 'spec_helper'

describe Interval, '#from' do
  it "should take a starting point and return the interval's top pitch class" do
    expect(Unison.from(D)).to eq D
    expect(MinorThird.from(Fs)).to eq A
    expect(PerfectFourth.from(D)).to eq G
    expect(MinorThird.from(B)).to eq D
    expect(MajorThird.from(B)).to eq Ds
  end

  it "should take a starting point and return the interval's bottom pitch class"do
    expect(Unison.down_from(D)).to eq D
    expect(MinorThird.down_from(Fs)).to eq Ds
    expect(PerfectFourth.down_from(D)).to eq A
    expect(MinorThird.down_from(B)).to eq Gs
    expect(MajorThird.down_from(B)).to eq G
  end
end
