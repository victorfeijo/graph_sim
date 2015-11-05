load 'element.rb'

class Vertice

    attr_accessor :adjacents, :element

    def initialize (adjacents = Hash.new, element=nil)
        @adjacents = adjacents
        @element = element
    end

    def connect (adjacent, weight=0)
        create_vertice(adjacent, weight) unless include_adjacent?(adjacent)
    end

    def update_weight (adjacent, weight=0)
        if include_vertice(adjacent)
            adjacents[adjacent] = weight
        end
    end

    def include_adjacent? (adjacent)
        @adjacents.has_key? (adjacent)
    end

    def create_vertice (adjacent, weight)
        @adjacents[adjacent] = weight
    end

end
# Just some tests...

a = Element.new(100)
b = Element.new("b")
c = Element.new(300)
vertice1 = Vertice.new(a)
vertice2 = Vertice.new(b)
vertice1.connect(vertice2, 30)
puts vertice1.include_adjacent?(vertice2)
puts vertice1.element.show_element
puts vertice2.element.show_element
puts b.is_number?
puts vertice1.adjacents[vertice2]
