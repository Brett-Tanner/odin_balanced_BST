require_relative './node.rb'

class Tree

    attr_accessor :root

    def initialize(array)
        no_dups = array.uniq
        sorted_array = no_dups.sort
        @root = self.build_tree(sorted_array)
    end

    def build_tree(array, start = 0, last = array.length - 1)
        return nil if last < 0 || start > last
        # make middle value of the array the data for this node
        mid_index = (start + last) / 2
        data = array[mid_index]
        # make middle of left half left child of this node
        l_child = build_tree(array, start, mid_index - 1)
        # make middle of right half right child of this node
        r_child = build_tree(array, mid_index + 1, last)
        Node.new(data, l_child, r_child)
    end

    def insert(value, node = @root) # TODO: these use the same block to traverse, some way to abstract that??
        return puts "#{value} already exists in this tree" if find(value)
        insert(value, node.l_child) if node > value && node.l_child != nil
        insert(value, node.r_child) if node < value && node.r_child != nil
        node.l_child = Node.new(value) if node > value && node.l_child == nil
        node.r_child = Node.new(value) if node < value && node.r_child == nil
    end

    def delete(value, node = @root)
        if node
            
        end
    end

    def find(value, node = @root) # TODO: these use the same block to traverse, some way to abstract that??
        return node if node == value
        return find(value, node.l_child) if node > value && node.l_child != nil
        return find(value, node.r_child) if node < value && node.r_child != nil
    end

    def level_order_iterative
        # traverses the tree breadth-first (remember we use queues for this)
        # accepts a block and yields each node to the block
        yield(node)

        # return an array of all the values if no block is provided
        values_array
    end

    def level_order_recursive
        # traverses the tree breadth-first (remember we use queues for this)
        # accepts a block and yields each node to the block
        yield(node)
        
        # return an array of all the values if no block is provided
        values_array
    end

    def inorder
        # traverses left, then parent, then right
        yield(node)

        # return an array of all the values if no block is provided
        values_array
    end

    def preorder
        # traverses parent, then left, then right
        yield(node)

        # return an array of all the values if no block is provided
        values_array
    end

    def postorder
        # traverses left, then right, then parent
        yield(node)

        # return an array of all the values if no block is provided
        values_array
    end

    def height(node)
        # height is the number of edges in the longest path from node to a leaf node
        height
    end

    def depth(node)
        # depth is the number of edges in the path to the root node from node
        depth
    end

    def balanced?
        # a tree is balanced if the difference in heights between the left and right subtree of every node is 1 or less
    end

    def rebalance
        # do this by traversing the tree to provide a new array to #build_tree
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.r_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.r_child
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.l_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.l_child
      end
end