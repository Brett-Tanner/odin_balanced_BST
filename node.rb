class Node

    include Comparable

    def <=>(other)
        if other.class == Node
            self.data <=> other.data
        else
            self.data <=> other
        end
    end

    attr_accessor :data, :l_child, :r_child

    def initialize(data, l_child = nil, r_child = nil)
        @data = data
        @l_child = l_child
        @r_child = r_child
    end
end