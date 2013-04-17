module Rameau
  class Phrase < Base
    include Rameau::Composeable

    validates_each :elements do |phrase, attr, elements|
      phrase.errors.add(attr, 'must be composeable') unless elements.all?{|e| e.respond_to?(:composeable?) }
    end

    attr_accessor :elements
    def initialize(*elements)
      @elements = Array(elements.flatten)
    end

    def <<(element)
      @elements = (@elements << element).flatten
      self
    end

    def duration
      @elements.map(&:duration).inject(0) {|total, d| total + d }
    end

    def to_s
      @elements.map(&:to_s).join(' ')
    end
  end
end
