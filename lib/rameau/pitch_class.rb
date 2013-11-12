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

    def inspect
      pitch_name = PITCH_INTEGER_MAP[base_pitch_integer]
      accidental = case offset <=> 0
                   when 0 then ''
                   when 1 
                      double, single = offset.divmod(2)
                      ('x' * double) + ('#' * single)
                   when -1 then 'b' * offset.abs
                   end

      "#{pitch_name}#{accidental}"
    end

    def method_missing(m, *a, &b)
      interval_name = m.to_s.gsub(/(^|_)./) {|m| m.upcase}.gsub(/_/, '')
      if Rameau.const_defined?(interval_name)
        find_interval(interval_name, a.include?(:down))
      elsif Rameau::Triad::TYPES.keys.include?(m)
        construct_triad(m)
      else
        super
      end
    end
  end
  
  private

  def find_interval(interval_name, down)
    interval = Rameau.const_get(interval_name)
    down ? interval.down_from(self) : interval.from(self)
  end

  def construct_triad(type)
    Triad.new(self, type)
  end
end
