module Rameau
  class PitchClass < Base
    include Comparable

    PITCH_CLASS_MAP = {
      0 => 'c',
      2 => 'd',
      4 => 'e',
      5 => 'f',
      7 => 'g',
      9 => 'a',
      11 => 'b'
    }

    validates :natural_degree, inclusion: { in: PITCH_CLASS_MAP.keys }
    attr_accessor :natural_degree

    def initialize(natural_degree)
      @natural_degree = natural_degree
      natural
    end

    def <=>(other_pitch_class)
      self.to_i <=> other_pitch_class.to_i
    end

    def to_i
      (natural_degree + @sharp - @flat) % 12
    end

    def to_s
      PITCH_CLASS_MAP[natural_degree] + accidental_sign
    end

    def accidental_sign
      offset = @sharp - @flat
      case offset <=> 0
      when 0 then ''
      when 1 then 's' * offset.abs
      else        'f' * offset.abs
      end
    end

    def natural
      @sharp = @flat = 0
      self
    end

    def sharp
      @sharp += 1
      self
    end

    def flat
      @flat += 1
      self
    end
  end
end
