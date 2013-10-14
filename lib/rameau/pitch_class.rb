module Rameau
  class PitchClass
    include Comparable
    PITCH_INTEGER_MAP = {
      0 => 'C',
      2 => 'D',
      4 => 'E',
      5 => 'F',
      7 => 'G',
      9 => 'A',
      11 => 'B'
    }

    attr_reader :base_pitch_integer, :offset
    def initialize(base_pitch_integer, offset=0)
      @base_pitch_integer, @offset = base_pitch_integer, offset
    end

    def diff(other_pitch_class)
      (other_pitch_class.to_i - self.to_i) % 12
    end

    def to_i
      (@base_pitch_integer + @offset) % 12
    end

    def base_pitch_name
      PITCH_INTEGER_MAP[@base_pitch_integer]
    end

    def sharp
      PitchClass.new(@base_pitch_integer, @offset + 1)
    end

    def flat
      PitchClass.new(@base_pitch_integer, @offset - 1)
    end

    def <=>(other_pitch_class)
      self.to_i <=> other_pitch_class.to_i
    end

    def to(other_pitch_class)
      Interval.between(self, other_pitch_class)
    end

    def down_to(other_pitch_class)
      other_pitch_class.to(self)
    end

    def method_missing(m, *a, &b)
      interval_name = m.to_s.gsub(/(^|_)./) {|m| m.upcase}.gsub(/_/, '')
      if Rameau.const_defined?(interval_name)
        if a.include?(:down)
          Rameau.const_get(interval_name).down_from(self)
        else
          Rameau.const_get(interval_name).from(self)
        end
      else
        super
      end
    end
  end
end
