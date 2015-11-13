load 'vertice.rb'

class Graph

    attr_accessor :vertices, :is_directed

    # Inicializa o grafo, caso não seja passado um conjunto de vertices
    # como parâmetro é criado um conjunto vazio. Se não for passado se o
    # grafo é direcionado ou não por parâmetro por default ele cria não direcionado
    def initialize (vertices = [], is_directed = false)
        @vertices = vertices
        @is_directed = is_directed
    end

    # Adiciona um vértice ao conjunto de vértices
    def add_vertice (vertice)
        @vertices << vertice
    end

    # Remove todas as arestas do vértice, depois remove do conjunto
    def remove_vertice (vertice)
        @vertices.each { |v| v.disconnect(vertice)}
        @vertices.delete(vertice)
    end

    # Cria uma aresta entre vertice1 e vertice2, também faz o contrário
    # caso o grafo não seja direcionado
    def connect (vertice1, vertice2, weight = 0)
        vertice1.connect(vertice2, weight)
        vertice2.connect(vertice1, weight) unless is_directed
    end

    # Desconecta o vertice1 do vertice2, caso ele não seja direcionado
    # também disconecta o vertice2 do vertice1
    def disconnect (vertice1, vertice2)
        vertice1.disconnect(vertice2)
        vertice2.disconnect(vertice1) unless is_directed
    end

    # Retorna a quantida de vértices do grafo
    def order
        return @vertices.size
    end

    # Seleciona um vértice aleatoriamente
    def rand_vertice
        prng = Random.new
        rand_index = prng.rand(0..(@vertices.size-1))
        return @vertices[rand_index]
    end

    # Retorna os vértices adjacentes
    def adjacents (vertice)
        index = vertices.find_index(vertice)
        return vertices[index].adjacents
    end

    # Retorna o grau de de um vértice
    def degree (vertice)
        index = vertices.find_index(vertice)
        return vertices[index].adjacents.size
    end

    # Verifica de o grafo é regular
    def isRegular?
        n = degree(rand_vertice)
        @vertices.each { |v|
            if degree(v) != n
                return false;
            end
        }
        return true;
    end

    # Verifica se o grafo é completo
    def isComplete?
        n = order - 1
        @vertices.each { |v|
            if degree(v) != n
                return false
            end
        }
        return true
    end

    def conexo?
        copy = @vertices.dup
        marked_vertices = []
        queue = [rand_vertice]
        queue.each { |e|
            copy.delete(e)
            marked_vertices << e
            e.adjacents.each_key { |a|
                queue << a if marked_vertices.include? a
            }
        queue.delete_at(0)
        }
        copy.empty? ? true : false
    end

    # Verifica se o grafo tem um ciclo recursivamente
    def has_cycle? (vertice1, ant_vertice1 = nil, visited_vertices = [])
        return true if visited_vertices.include? vertice1
        visited_vertices << vertice1
        vertice1.adjacents.each_key { |v|
            if v != ant_vertice1
                return true if has_cycle?(v, vertice1, visited_vertices)
            end
        }
        return false
    end

    # Retorna se o grafo é uma árvore
    def tree?
        @vertices.each { |e|
            return false if has_cycle?(e)
         }
        return true
    end

    # Calcula o fecho transitivo de um vertice
    def transitive_closure (vertice1, visited_vertices = [], is_first = false)
        visited_vertices << vertice1 if is_first
        vertice1.adjacents.each_key { |a|
            if not visited_vertices.has? (a)
                visited_vertices = transitive_closure(a, visited_vertices)
            end
        }
        return visited_vertices
    end

end

# just some tests ..

v1 = Vertice.new("v1")
v2 = Vertice.new("v2")
v3 = Vertice.new("v3")
v4 = Vertice.new("v4")
graph = Graph.new([])
graph.add_vertice(v1)
graph.add_vertice(v2)
graph.add_vertice(v3)
graph.connect(v1, v2)
graph.connect(v1, v3)
graph.connect(v2, v3)

puts graph.order
puts graph.degree (v1)
puts graph.degree (v2)
puts graph.degree (v3)

puts graph.rand_vertice.element
puts graph.isComplete?
puts graph.isRegular?
puts graph.conexo?
puts graph.has_cycle?(v1)
puts graph.has_cycle?(v2)
puts graph.has_cycle?(v3)
puts graph.tree?
