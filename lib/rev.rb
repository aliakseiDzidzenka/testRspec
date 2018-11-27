# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :nextN
  def initialize(val)
    if local_variables.length != 1
      raise ArgumentError.new("Wrong number of arguments")
    end
    @val = val
    @nextN = nil
  end
end

def show(head)
  if head.is_a?(ListNode) == false
    "Argument is not a ListNode"
  else
    values = ""
    tmp_el = head
    values += "Your list values { "
    while !tmp_el.nextN.nil?
      values += tmp_el.val.to_s + " => "
      tmp_el = tmp_el.nextN
    end
    values += tmp_el.val.to_s + " }"
  end
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
  if head.is_a?(ListNode) == false
    raise ArgumentError.new("Only ListNode is allowed")
  else
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
end

# head = ListNode.new(1)
# insert(head,2)
# insert(head,3)
# insert(head,4)
# insert(head,5)

# puts show(head)

# head = reverse_list(head)

# puts show(head)
