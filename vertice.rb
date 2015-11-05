load 'element.rb'

class Vertice

    attr_accessor :adjacents, :element

    def initialize (element = nil)
        @adjacents = Hash.new
        @element = element
    end

    def connect (adjacent, weight = 0)
        create_connection(adjacent, weight) unless include_adjacent?(adjacent)
    end

    def disconnect (adjacent)
        if include_adjacent? (adjacent)
            @adjacents.delete(adjacent)
        end
    end

    def update_weight (adjacent, weight = 0)
        if include_adjacent? (adjacent)
            adjacents[adjacent] = weight
        end
    end

    def include_adjacent? (adjacent)
        @adjacents.has_key? (adjacent)
    end

    def create_connection(adjacent, weight)
        @adjacents[adjacent] = weight
    end

end
