require_relative './node.rb'

class Tree
    def initialize(array)
        p array
        no_dups = array.uniq
        p no_dups
        sorted_array = no_dups.sort
        p sorted_array
        @root = self.build_tree(sorted_array)
    end

    # creates balanced binary tree of node objects with data from array
    def build_tree(array, start = 0, last = array.length - 1)
        return nil if last < 0
        return nil if start == last
        # make middle value of the array = root - do this recursively to make the whole tree
        mid_index = (start + last) / 2
        data = array[mid_index]
        p start
        p last
        p data
        # make middle of left half left child of root
        l_child = build_tree(array, start, mid_index - 1)
        p l_child
        # make middle of right half right child of root
        r_child = build_tree(array, mid_index + 1, last)
        # return the root node
        Node.new(data, l_child, r_child)
    end

    def insert(value)
        # check the value is not already in the tree, duplicates are hard
    end

    def delete(value)
        
    end

    def find(value)
       
        # return node with that value
        node
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
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
      end
end