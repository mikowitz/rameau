module Rameau
  class Interval
    include Comparable
    NATURALS = %w(C D E F G A B)
    attr_accessor :natural_interval, :total_interval
    def initialize(natural_interval, total_interval)
      @natural_interval = natural_interval
      @total_interval = total_interval % 12
    end

    def self.between(pitch_class1, pitch_class2)
      natural_interval = natural_index(pitch_class2) - natural_index(pitch_class1)
      total_interval = pitch_class1.diff(pitch_class2)
      natural_interval %= 7 if natural_interval < 0
      self.new(natural_interval, total_interval)
    end

    def from(pitch_class)
      calculate_from(pitch_class, :up)
    end

    def down_from(pitch_class)
      calculate_from(pitch_class, :down)
    end

    def <=>(other_interval)
      [@natural_interval, @total_interval] <=> [other_interval.natural_interval, other_interval.total_interval]
    end

    def self.natural_index(pitch_class)
      NATURALS.index(pitch_class.base_pitch_name)
    end

    def calculate_from(pitch_class, direction)
      operator = direction == :down ? :- : :+
      target_interval = pitch_class.to_i.send(operator, total_interval) % 12
      target_natural = NATURALS[(Interval.natural_index(pitch_class) + self.natural_interval) % NATURALS.size]
      target_base_pitch_index = PitchClass::PITCH_INTEGER_MAP.invert[target_natural]
      target_offset = target_interval - target_base_pitch_index
      PitchClass.new(target_base_pitch_index, target_offset)
    end
  end
end
