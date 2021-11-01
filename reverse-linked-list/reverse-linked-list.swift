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
/**
time -> O(n) where n is number of nodes
space -> O(1)
*/
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var (cur, prev): (ListNode?, ListNode?) = (head, nil)
        while cur != nil {
            let next = cur?.next
            cur!.next = prev
            prev = cur
            cur = next
        }
        return prev
    }
}