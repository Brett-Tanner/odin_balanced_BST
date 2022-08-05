require_relative '/node.rb'

class Tree
    def initialize(array)
        @root = self.build_tree
    end

    def build_tree
        
        root
    end

    def insert(value)
        
    end

    def delete(value)
        
    end

    def find(value)
        
    end

    def level_order_iterative
        yield

        values_array
    end

    def level_order_recursive
        yield
        
        values_array
    end

    def inorder
        yield

        values_array
    end

    def preorder
        yield

        values_array
    end

    def postorder
        yield

        values_array
    end

    def height(node)
        
        height
    end

    def depth(node)
        
        depth
    end

    def balanced?
        
    end

    def rebalance
        
    end
end