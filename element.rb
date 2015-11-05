class Element

    attr_accessor :data

    def initialize (data)
        @data = data
    end

    def show_element
        puts "The element is #{@data}"
    end

    def is_number?
        return @data.is_a?(Numeric)
    end

end
