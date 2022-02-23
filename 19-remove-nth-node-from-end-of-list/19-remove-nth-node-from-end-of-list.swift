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
1, n = 1
d -> 1
"""
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy = ListNode(0, head)
        var slower: ListNode? = dummy
        var faster = head
        var remaining = n
        while remaining > 0 {
            faster = faster?.next
            remaining -= 1
        }
        while faster != nil {
            slower = slower?.next
            faster = faster?.next
        }
        slower?.next = slower?.next?.next
        return dummy.next
    }
}