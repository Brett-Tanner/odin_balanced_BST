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

    def insert(value, node = @root)
        return puts "#{value} already exists in this tree" if find(value)
        insert(value, node.l_child) if go_left?(node, value)
        insert(value, node.r_child) if go_right?(node, value)
        node.l_child = Node.new(value) if node > value && node.l_child == nil
        node.r_child = Node.new(value) if node < value && node.r_child == nil
    end

    def delete(value, node = @root, parent = nil)
        if node == value
            case node.child_count
            when 0
                return parent.l_child = nil if node < parent
                return parent.r_child = nil if node > parent
            when 1
                parent.l_child = node.only_child if node < parent
                parent.r_child = node.only_child if node > parent
            when 2
                succ_data = min_child(node.r_child).data
                delete(succ_data)
                node.data = succ_data
            else
                puts "Unexpected child count"
                exit(1)
            end
        end
        delete(value, node.l_child, node) if go_left?(node, value)
        delete(value, node.r_child, node) if go_right?(node, value)
    end

    def go_left?(node, value)
        node > value && node.l_child != nil
    end

    def go_right?(node, value)
        node < value && node.r_child != nil
    end

    def min_child(node)
        return node if node.l_child == nil
        min_child(node.l_child)
    end

    def find(value, node = @root)
        node if node == value
        find(value, node.l_child) if go_left?(node, value)
        find(value, node.r_child) if go_right?(node, value)
    end

    def level_order_iterative
        values_array = []
        queue = [@root]
        while !queue.empty?
            yield(queue[0]) if block_given?
            values_array << queue[0].data
            queue << queue[0].l_child unless queue[0].l_child == nil
            queue << queue[0].r_child unless queue[0].r_child == nil
            queue.shift
        end
        values_array
    end

    def level_order(node = @root, queue = [], values_array = [], &block)
        queue.shift
        yield(node) if block_given?
        queue << node.l_child unless node.l_child == nil
        queue << node.r_child unless node.r_child == nil
        # return an array of all the values if no block is provided
        values_array << node.data
        return values_array if queue.empty?
        level_order(queue[0], queue, values_array, &block)
    end

    def inorder(node = @root, values_array = [], &block)
        inorder(node.l_child, values_array, &block) unless node.l_child == nil
        yield(node) if block_given?
        values_array << node.data
        inorder(node.r_child, values_array, &block) unless node.r_child == nil
        values_array
    end

    def preorder(node = @root, values_array = [], &block)
        yield(node) if block_given?
        values_array << node.data
        preorder(node.l_child, values_array, &block) unless node.l_child == nil
        preorder(node.r_child, values_array, &block) unless node.r_child == nil
        values_array
    end

    def postorder(node = @root, values_array = [], &block)
        postorder(node.l_child, values_array, &block) unless node.l_child == nil
        postorder(node.r_child, values_array, &block) unless node.r_child == nil
        yield(node) if block_given?
        values_array << node.data
        values_array
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

    # private

    def height(node)
        return 0 if node.leaf?
        l_height = node.l_child == nil ? 0 : height(node.l_child) 
        r_height = node.r_child == nil ? 0 : height(node.r_child) 
        height = [l_height, r_height].max
        height += 1
    end

    def depth(node)
        
        # depth is the number of edges in the path to the root node from node
        depth
    end
end