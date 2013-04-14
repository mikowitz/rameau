require 'spec_helper'

describe Rameau do
  include Rameau
  describe 'pitch class shortcut methods' do
    it 'should return valid pitch classes' do
      expect(a.to_i).to eq 9
      expect(as).to eq bf
      expect(as).to eq a.sharp
      expect(e.flat).to eq ef
    end
  end
end
