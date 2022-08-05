require_relative './tree.rb'

test = Tree.new(Array.new(15) {rand(1..100)})

p test

# puts "The tree is balanced!" if test.balanced?

# p test.level_order_iterative
# p test.level_order_recursive
# p test.preorder
# p test.postorder
# p test.inorder

# 15.times {|i| self.insert(rand(101..200) + i)}

# puts "You unbalanced the tree!" unless test.balanced?

# test.rebalance

# puts "You rebalanced the tree!" if test.balanced?

# p test.level_order_iterative
# p test.level_order_recursive
# p test.preorder
# p test.postorder
# p test.inorder