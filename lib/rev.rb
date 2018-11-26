# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :nextN
    def initialize(val)
        @val = val
        @nextN = nil
    end
end

def display(head)

		tmp_el = head

		while !tmp_el.nextN.nil?
			p tmp_el.val
			tmp_el = tmp_el.nextN
		end
		p tmp_el.val

end
def insert(head, value)
		node = ListNode.new(value)
		if head.nil?
			head = node
		else
			tmp_el = head

		while !tmp_el.nextN.nil?
			tmp_el = tmp_el.nextN
		end

		tmp_el.nextN = node
	end
end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
   prev_node = nil
   next_node = nil

   while head
   	  next_node = head.nextN
   	  head.nextN = prev_node
   	  prev_node = head
   	  head = next_node
	end 
	return head = prev_node
end

head = ListNode.new(1)
insert(head,2)
insert(head,3)
insert(head,4)
insert(head,5)

#display(head)

head = reverse_list(head)

#display(head)