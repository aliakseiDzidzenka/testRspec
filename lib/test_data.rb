$LOAD_PATH.unshift(".")
require 'rev_linked_list'

value = 1

def reset_value
	1
end

def reset_head_node(value)
	ListNode.new(value)
end

def reset_in_node
	in_node1 = ListNode.new(1)
	in_node1.next_n = ListNode.new(2)
	in_node1.next_n.next_n = ListNode.new(3)
	in_node1.next_n.next_n.next_n = ListNode.new(4)
	return in_node1
end
