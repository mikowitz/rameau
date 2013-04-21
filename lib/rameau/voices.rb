module Rameau
  class Voices < Base
    include Composeable

    validates_each :voices do |voices, attr, parts|
      voices.errors.add(attr, 'must be composeable') unless parts.all?{|p| p.respond_to?(:composeable?) }
    end
    
    attr_accessor :voices
    def initialize(*voices)
      @voices = Array(voices)
    end

    def to_s
      voices_to_s = @voices.map(&:to_s)
      longest_voice_length = voices_to_s.map(&:length).sort.last
      voices_to_s.join("\n#{'-' * longest_voice_length}\n")
    end
  end
end
