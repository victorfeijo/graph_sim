load 'edge.rb'

class Vertice

    attr_accessor :adjacents, :element

    def initialize (element = nil)
        @adjacents = Hash.new
        @element = element
    end

    #Cria uma aresta entre dois vértices
    def connect (adjacent, weight = 0)
        @adjacents[adjacent] = Edge.new(self, adjacent, weight)
    end

    #Se ele contém esse adjacente, remove do hashMap
    def disconnect (adjacent)
        if include_adjacent? (adjacent)
            @adjacents.delete(adjacent)
        end
    end

    #Verifica se esta conectado com o adjacente
    def include_adjacent? (adjacent)
        @adjacents.has_key? (adjacent)
    end

end
