module Rameau
  module Composeable
    def composeable?; true; end

    def +(other)
      return self unless other.respond_to?(:composeable?)
      Phrase.new(self) << other
    end

    def |(other)
      return self unless other.respond_to?(:composeable?)
      Piece.new(self, other)
    end
  end
end
