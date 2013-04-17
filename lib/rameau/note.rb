module Rameau
  class Note < Base
    include Rameau::Composeable
    validates :duration, numericality: { greater_than: 0 }
    validates_each :pitch do |note, attr, pitch|
      note.errors.add(attr, 'must be a valid pitch') unless pitch.is_a?(Pitch) && pitch.valid?
    end

    attr_accessor :pitch, :duration
    def initialize(pitch, duration)
      @pitch = pitch
      @duration = duration
    end

    def to_s
      "#{pitch.to_s}(#{"%.3f" % duration})"
    end
  end
end
