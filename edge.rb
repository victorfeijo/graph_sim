class Edge
    attr_accessor :vertice1, :vertice2, :weight, :is_marked

    def initialize(vertice1, vertice2, weight = 0)
        @vertice1 = vertice1
        @vertice2 = vertice2
        @weight = weight
        @is_marked = false
    end

end
