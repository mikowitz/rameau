module Rameau
  class Rest < Base
    include Rameau::Composeable
    validates :duration, numericality: { greater_than: 0 }
    
    attr_accessor :duration
    def initialize(duration)
      @duration = duration 
    end

    def to_s
      "r(#{"%0.3f" % duration})"
    end
  end
end
