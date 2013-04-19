module Rameau
  class Piece < Base
    include Composeable

    validates_each :parts do |piece, attr, parts|
      piece.errors.add(attr, 'must be composeable') unless parts.all?{|p| p.respond_to?(:composeable?) }
    end
    
    attr_accessor :parts
    def initialize(*parts)
      @parts = Array(parts)
    end

    def to_s
      parts_to_s = @parts.map(&:to_s)
      longest_part_length = parts_to_s.map(&:length).sort.last
      parts_to_s.join("\n#{'-' * longest_part_length}\n")
    end
  end
end
