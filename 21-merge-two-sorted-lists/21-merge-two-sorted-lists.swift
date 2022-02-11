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
1 2 4
1 3 4

1
3
0 -> 1 -> 1

"""
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var head1 = list1
        var head2 = list2
        var merged: ListNode? = ListNode(0)
        let dummy = merged
        while let node1 = head1, let node2 = head2 {
            if node1.val < node2.val {
                merged?.next = node1
                head1 = node1.next
            } else {
                merged?.next = node2
                head2 = node2.next
            }
            
            merged = merged?.next
        }
        merged?.next = head1 ?? head2
        return dummy?.next
    }
}