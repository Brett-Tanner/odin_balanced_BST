class Node

    include Comparable

    def <=>(other)
        if other.class == Node
            self.data <=> other.data
        else
            self.data <=> other
        end
    end

    def leaf?
        return true if @l_child == nil && @r_child == nil
        false
    end

    def child_count
        return 0 if self.leaf?
        return 1 if l_child == nil || r_child == nil
        return 2
    end
    
    def only_child
        return l_child if r_child == nil
        r_child
    end

    attr_accessor :data, :l_child, :r_child

    private

    def initialize(data, l_child = nil, r_child = nil)
        @data = data
        @l_child = l_child
        @r_child = r_child
    end
end