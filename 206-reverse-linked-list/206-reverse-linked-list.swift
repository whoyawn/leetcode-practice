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
1->2->3
1<-2<-3
"""
// class Solution {
//     func reverseList(_ head: ListNode?) -> ListNode? {
//         var newHead: ListNode?
//         func reverse(_ head: ListNode?) -> ListNode? {
//             guard let cur = head else { return nil }
//             if cur.next == nil {
//                 newHead = cur
//             }
//             let next = reverse(cur.next)
//             next?.next = cur
//             return cur
//         }
//         reverse(head)?.next = nil

//         return newHead
//     }
// }
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        func reverse(_ cur: ListNode?, _ prev: ListNode? = nil) -> ListNode? {
            guard cur != nil else { return prev }
            let next = cur?.next
            cur?.next = prev
            let newHead = reverse(next, cur)
            return newHead
        }
        return reverse(head)
    }
}
