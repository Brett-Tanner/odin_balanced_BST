require_relative './tree.rb'

test = Tree.new(Array.new(15) {rand(1..100)})

test.pretty_print

# puts "The tree is balanced!" if test.balanced?

# p test.level_order_iterative
test.level_order
test.inorder
test.preorder
test.postorder

15.times {|i| test.insert(rand(101..200) + i)}

# puts "You unbalanced the tree!" unless test.balanced?

# test.rebalance

# puts "You rebalanced the tree!" if test.balanced?

# p test.level_order_iterative
test.level_order
test.inorder
test.preorder
test.postorder