module Rameau
  class Pitch < Base
    include Comparable

    validates :octave, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates_each :pitch_class do |pitch, attr, pitch_class|
      pitch.errors.add(attr, 'must be a valid pitch class') unless pitch_class.is_a?(PitchClass) && pitch_class.valid?
    end
    attr_accessor :pitch_class, :octave

    def initialize(pitch_class, octave)
      @pitch_class = pitch_class
      @octave = octave
    end

    def to_i
      (octave * 12) + pitch_class.to_i_for_pitch
    end

    def <=>(other_pitch)
      self.to_i <=> other_pitch.to_i
    end

    def sharp
      Pitch.new(pitch_class.sharp, octave)
    end

    def flat
      Pitch.new(pitch_class.flat, octave)
    end

    def to_s
      "#{pitch_class.to_s}#{octave}"
    end
  end
end
