Dir[File.dirname(__FILE__) + '/rameau/**/*.rb'].each {|file| require file}

module Rameau
  PitchClass::PITCH_INTEGER_MAP.each do |degree, name|
    self.const_set(name, PitchClass.new(degree))
    self.const_set("#{name}s", self.const_get(name).sharp)
    self.const_set("#{name}f", self.const_get(name).flat)
  end
  Unison = Interval.new(0, 0)
  AugmentedUnison = Interval.new(0, 1)
  PerfectFourth = Interval.new(3, 5)
  AugmentedFourth = Interval.new(3, 6)
  DiminishedFifth = Interval.new(4, 6)
  PerfectFifth = Interval.new(4, 7)
  AugmentedFifth = Interval.new(4, 8)

  {:Second => [1, 2], :Third => [2, 4],
    :Sixth => [5, 9], :Seventh => [6, 11]}.each do |name, intervals|
    natural_interval, major_total_interval = intervals
    self.const_set("Major#{name}", Interval.new(natural_interval, major_total_interval))
    self.const_set("Minor#{name}", Interval.new(natural_interval, major_total_interval - 1))
    self.const_set("Augmented#{name}", Interval.new(natural_interval, major_total_interval + 1))
  end
end
