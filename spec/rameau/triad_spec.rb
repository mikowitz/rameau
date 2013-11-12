require 'spec_helper'

describe Triad do
  it 'can handle inversions' do
    expect(C.major.first_inversion.notes).to eq [E, G, C]
    expect(C.major.second_inversion.notes).to eq [G, C, E]
  end
end

describe Triad, 'equality' do
  it 'compares between triads of the same inversion' do
    expect(C.major).to eq Triad.new(C, :major)
    expect(C.major.first_inversion).to eq Triad.new(C, :major, 1)
  end

  it 'can find equality between triads of different inversion' do
    expect(C.major).to eq Triad.new(C, :major, 2)
  end

  # is this true?
  it 'should not find equality between enharmonically equivalent augmented triads' do
    expect(C.augmented).to_not eq E.augmented
  end
end

