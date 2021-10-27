/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

"""
intersection = hit the same some
store A's nodes in a set and then check nodes in B if they're the same
"""
extension ListNode: Equatable, Hashable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(next?.val ?? 0)
    }
}
class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var s = Set<ListNode>()
        var cur = headA
        while cur != nil {
            s.insert(cur!)
            cur = cur?.next
        }
        var curB = headB
        while curB != nil {
            if s.contains(curB!) {
                return curB
            }
            curB = curB?.next
        }
        return nil
    }
}