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
/->1->2->/ ... /->2->1->/
1->/

cur = 2, next = nil
nil->next = 2
return nil
"""
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var newHead: ListNode?
        func reverse(_ head: ListNode?) -> ListNode? {
            guard let cur = head else { return nil }
            if cur.next == nil {
                newHead = cur
            }
            let next = reverse(cur.next)
            next?.next = cur
            return cur
        }
        reverse(head)?.next = nil

        return newHead
    }
}