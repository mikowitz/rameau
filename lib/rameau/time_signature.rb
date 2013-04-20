module Rameau
  class TimeSignature < Base
    validates :beats, numericality: { greater_than: 0, only_integer: true } 

    validates_each :subdivisions do |time_signature, attr, subdivisions|
      time_signature.errors.add(attr, 'must be a power of 2') unless subdivisions > 0 &&
        Math.log2(subdivisions) % 1 == 0
    end

    attr_accessor :beats, :subdivisions
    def initialize(beats, subdivisions)
      @beats = beats
      @subdivisions = subdivisions
    end

    def duration
      beats.to_f / subdivisions
    end

    def to_s
      "#{beats}/#{subdivisions}"
    end
  end
end
