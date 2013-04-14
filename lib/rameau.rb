require 'active_model'
Dir[File.dirname(__FILE__) + '/rameau/**/*.rb'].each {|file| require file}

module Rameau
  PitchClass::PITCH_CLASS_MAP.each do |degree, name|
    define_method(name) do
      PitchClass.new(degree)
    end
    define_method("#{name}s") do
      send(name).sharp
    end
    define_method("#{name}f") do
      send(name).flat
    end
  end
end
