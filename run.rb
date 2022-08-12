require_relative './tree.rb'

test = Tree.new(Array.new(15) {rand(1..100)})

test.pretty_print

puts "The tree is balanced!" if test.balanced?

puts "Here are the elements in level order:"
test.level_order {|node| print node.data}
puts "\nHere are the elements in order:"
test.inorder {|node| print node.data}
puts "\nHere are the elements in preorder:"
test.preorder {|node| print node.data}
puts "\nHere are the elements in postorder:"
test.postorder {|node| print node.data}
puts ""

15.times {|i| test.insert(rand(101..200) + i)}

test.pretty_print

puts "You unbalanced the tree!" unless test.balanced?

test.rebalance

test.pretty_print

puts "You rebalanced the tree!" if test.balanced?

puts "Here are the elements for the rebalanced array in level order:"
test.level_order {|node| print node.data}
puts "\nHere are the elements for the rebalanced array in order:"
test.inorder {|node| print node.data}
puts "\nHere are the elements for the rebalanced array in preorder:"
test.preorder {|node| print node.data}
puts "\nHere are the elements for the rebalanced array in postorder:"
test.postorder {|node| print node.data}