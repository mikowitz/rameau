module Rameau
  class Measure < Base
    validates_each :time_signature do |measure, attr, time_signature|
      measure.errors.add(attr, 'must be a valid time signature') unless time_signature.is_a?(TimeSignature)
    end
    attr_accessor :time_signature, :contents
    def initialize(time_signature, *contents)
      @time_signature = time_signature
      @contents = Phrase.new(*contents)
    end

    def <<(element)
      if element.respond_to?(:composeable?)
        @contents << element
        self
      else
        raise Rameau::NonComposeableElement
      end
    end

    def to_s
      ("%s) %s %s" % [@time_signature.to_s, @contents.to_s, fill_notice]).strip
    end

    private

    def fill_notice
      difference = (@time_signature.duration - @contents.duration).abs
      return '' if fill_status == :filled
      "[%s by %.3f]" % [fill_status, difference]
    end

    def fill_status
      case @contents.duration <=> @time_signature.duration
      when 0  then  :filled
      when 1  then  :overfilled
      when -1 then  :underfilled
      else          raise TypeError
      end
    end
  end
end
