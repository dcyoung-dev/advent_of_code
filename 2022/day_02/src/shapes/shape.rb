module Shapes
  class Shape
    include Comparable

    def self.for_letter?(letter)
      self.const_get(:LETTERS).include?(letter)
    end

    def points
      self.class::POINTS
    end

    def <=>(other)
      if other.is_a?(self.class::BEATS.split('::').inject(Object) {|o,c| o.const_get c})
        return 1
      elsif other.is_a?(self.class)
        return 0
      end

      -1
    end
  end
end