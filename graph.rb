load 'vertice.rb'

class Graph

    attr_accessor :vertices, :is_directed

    def initialize (vertices = [], is_directed = false)
        @vertices = vertices
        @is_directed = is_directed
    end

    def add_vertice (vertice)
        @vertices << vertice
    end

    def remove_vertice (vertice)
        @vertices.each { |v| v.disconnect(vertice)}
        @vertices.delete(vertice)
    end

    def connect (vertice1, vertice2, weight = 0)
        vertice1.connect(vertice2, weight)
        vertice2.connect(vertice1, weight) unless is_directed
    end

    def disconnect (vertice1, vertice2)
        vertice1.disconnect(vertice2)
        vertice2.disconnect(vertice1) unless is_directed
    end

    def order
        return @vertices.size
    end

    def rand_vertice
        prng = Random.new
        rand_index = prng.rand(0..(@vertices.size-1))
        return @vertices[rand_index]
    end

    def adjacents (vertice)
        index = vertices.find_index(vertice)
        return vertices[index].adjacents
    end

    def degree (vertice)
        index = vertices.find_index(vertice)
        return vertices[index].adjacents.size
    end

    def show_connecteds
        vertices.each { |v|
        v.adjacents.each_key { |a|
        puts "#{v.element.show_element} <----> #{a.element.show_element} "
            }
         }
     end

end

# just some tests ..

a = Element.new("v1")
b = Element.new("v2")
c = Element.new("v3")
d = Element.new("v4")
v1 = Vertice.new(a)
v2 = Vertice.new(b)
v3 = Vertice.new(c)
v4 = Vertice.new(d)
graph = Graph.new([], true)
graph.add_vertice(v1)
graph.add_vertice(v2)
graph.add_vertice(v3)
graph.add_vertice(v4)
graph.connect(v1, v2)
graph.connect(v1, v3)
graph.connect(v2, v3)

puts graph.order
graph.show_connecteds
puts graph.degree (v1)
puts graph.rand_vertice.element.show_element
graph.remove_vertice(v1)
graph.show_connecteds
