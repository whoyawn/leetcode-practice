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
12421 -> 5, pop off 3

1221

odd/even

stack: O(n) time, O(n) space
"""
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var nodes: [ListNode] = []
        var cur = head
        while let node = cur {
            nodes.append(node)
            cur = cur?.next
        }
        var (l, r) = (0, nodes.count - 1)
        while l <= r {
            if nodes[l].val != nodes[r].val {
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }
}