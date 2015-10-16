class Graph

    attr_accessor :vertices, :edges
    
    def initialize (vertices = [], edges = [])
        @vertices = vertices
        @edges = edges
    end

    def connect (a, b)
        create_vertice(a) unless include_vertice?(a)
        create_vertice(b) unless include_vertice?(b)
        @edges << "#{a}-#{b}"
    end

    def print_edges
        @edges.each { |edge| puts edge}
    end

    def include_vertice? (vertice)
        @vertices.include? (vertice)
    end

    def create_vertice (vertice)
        @vertices << vertice
    end

end
# Just some tests...
graph = Graph.new ['a', 'c', 'd', 'b'], ['c-d']
graph2 = Graph.new
graph2.connect ('y', 'u')
graph.connect ('a', 'b')
graph.print_edges
puts graph.include_vertice? ('b')
puts graph.include_vertice? ('w')
graph.connect ('w', 'a')
graph.connect ('w', 'j')
graph.print_edges
puts graph.include_vertice? ('w')
graph2.print_edges
