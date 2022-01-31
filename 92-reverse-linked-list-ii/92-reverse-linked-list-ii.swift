/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
"""
output: front of list with nodes in between reversed

1,2,3,4,5
1,4,3,2,5, reverse [2,5]

5,4,3,2,1 entire [1,5]
3,2,1,4,5 beg [1,3]
1,2,5,4,3 end [3,5]

5, left = 1 right = 1, reverse [1,1]

reversing: ref to beg
go to end, reverse all until hit null = end

attach left - 1 to front, attach right + 1 to back
return global front

1,2,3,4,5
ref: [2, 4] & [1, 5]

dummy->1,2,3->dummy

1->2->3 ... 3->2->1
head = nil
while cur != nil
    let next = cur.next
    cur.next = head
    head = cur
    cur = next
    
"""
class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var dummy = ListNode(0, head)
        var outerLeft: ListNode?
        var outerRight: ListNode?
        var innerLeft: ListNode?
        var innerRight: ListNode?
        var node: ListNode? = dummy
        var count = 0
        while let n = node {
            if count + 1 == left {
                outerLeft = n
                innerLeft = n.next
            } else if count == right {
                innerRight = n
                outerRight = n.next
            }
            node = n.next
            count += 1
        }
        func reverse(_ front: ListNode?) -> ListNode? {
            guard front != nil else { return nil }
            var cur = front
            var newInnerLeft = outerRight
            while cur !== outerRight {
                let next = cur?.next
                cur?.next = newInnerLeft
                newInnerLeft = cur
                cur = next
            }
            return newInnerLeft
        }
        innerLeft = reverse(innerLeft)
        outerLeft?.next = innerLeft
        return dummy.next
    }
}