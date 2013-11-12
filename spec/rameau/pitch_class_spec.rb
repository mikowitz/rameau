require 'spec_helper'

describe PitchClass do
  it 'should be able to calculate interval' do
    expect(C.diff C).to eq 0
    expect(C.diff Cs).to eq 1
    expect(C.diff D).to eq 2
    expect(D.diff C).to eq 10
    expect(Ef.diff C).to eq 9
  end

  it 'should be able to establish a pitch class hierarchy based on C' do
    expect(Cs).to eq Df
    expect(Cf).to eq B
    expect(D).to be > Df
    expect(C).to be < Cs
  end

  it 'should be able to return the interval between two pitch classes' do
    expect(C.to C).to eq Unison
    expect(C.to Cs).to eq AugmentedUnison
    expect(E.to F).to eq MinorSecond
    expect(C.to D).to eq MajorSecond
    expect(Ef.to Gf).to eq MinorThird
    expect(Ef.to Fs).to eq AugmentedSecond
    expect(D.to Fs).to eq MajorThird
    expect(C.to F).to eq PerfectFourth
    expect(C.to Fs).to eq AugmentedFourth
    expect(C.to Gf).to eq DiminishedFifth
    expect(C.to G).to eq PerfectFifth
    expect(C.down_to F).to eq PerfectFifth
    expect(C.to Af).to eq MinorSixth
    expect(C.to A).to eq MajorSixth
    expect(C.to As).to eq AugmentedSixth
    expect(C.to Bf).to eq MinorSeventh
    expect(C.to B).to eq MajorSeventh
    expect(C.to Bs).to eq AugmentedSeventh
  end

  it 'should be able to call an interval on a pitch class and get the correct note back' do
    expect(C.major_third).to eq E
    expect(C.minor_sixth).to eq Af
    expect(C.perfect_fourth(:down)).to eq G
  end

  it 'should be able to generate a triad' do
    expect(C.major.notes).to eq [C, E, G]
    expect(D.minor.notes).to eq [D, F, A]
    expect(E.diminished.notes).to eq [E, G, Bf]
    expect(F.augmented.notes).to eq [F, A, Cs]
  end
end
