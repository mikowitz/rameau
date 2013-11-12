module Rameau
  class Triad
    TYPES = {
      major: %w( Unison MajorThird PerfectFifth ),
      minor: %w( Unison MinorThird PerfectFifth ),
      diminished: %w( Unison MinorThird DiminishedFifth ),
      augmented: %w( Unison MajorThird AugmentedFifth )
    }

    attr_reader :notes, :root
    def initialize(root, type, inversion=0)
      @root, @type = root, type
      @notes = TYPES[type].map do |interval|
        Rameau.const_get(interval).from(root)
      end
      @notes = @notes[inversion..-1] + @notes[0...inversion]
    end

    def first_inversion
      Triad.new(@root, @type, 1) 
    end
    
    def second_inversion
      Triad.new(@root, @type, 2)
    end

    def ==(other_triad)
      (self.notes.sort == other_triad.notes.sort) &&
        (self.root == other_triad.root)
    end
  end
end
