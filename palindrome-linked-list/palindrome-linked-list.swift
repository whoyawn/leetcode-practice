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
bbabb
1. pointers
2. reverse the list

stack:
find the middle first, starting from middle (or left mid if even), pop and compare
O(n) time, O(n) space
"""
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head?.next == nil {
            return true
        }
        var stack: [Int] = []
        var count = 0
        var c = head
        while c != nil {
            c = c?.next
            count += 1
        }
        c = head
        for i in 0..<count / 2 {
            stack.append(c!.val)
            c = c?.next
        }
        if count % 2 != 0 {
            c = c?.next
        }
        while c != nil {
            if stack.popLast() != c?.val {
                return false
            }
            c = c?.next
        }
        return true
    }
}