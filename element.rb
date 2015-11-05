class Element

    attr_accessor :data

    def initialize (data)
        @data = data
    end

    def show_element
        return @data
    end

    def is_number?
        return @data.is_a?(Numeric)
    end

end
