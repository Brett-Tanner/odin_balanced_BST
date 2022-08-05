class Node

    # TODO: include comparable module so I can compare nodes by data??

    attr_accessor :data, :l_child, :r_child

    def initialize(data, l_child = nil, r_child = nil)
        @data = data
        @l_child = l_child
        @r_child = r_child
    end
end