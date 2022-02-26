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
recent item -> stack
1 -> [0]
3 2 1 -> [0, 0, 0]
1 2 3 -> [2, 3, 0]
7 1 5 -> [0, 5, 0]
7 3 2 1 5 8-> [0/,5,5,5,0/]

> < < < .
2 7 4 3 5

for decreasing list, if node c > a, c > a..<c

for incerasing list, i + 1 > i

top pointer = cur
backwards pointers = dyn generated when inc

last = 0
time: O(n)
"""
class Solution {
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        var largerNodes: [Int] = []
        var stack: [(val: Int, i: Int)] = []
        var (cur, i) = (head, 0)
        while let node = cur {
            largerNodes.append(0)
            while let top = stack.last, node.val > top.val {
                largerNodes[top.i] = node.val
                stack.removeLast()
            }
            stack.append((node.val, i))
            i += 1
            cur = cur?.next
        }
        return largerNodes
    }
}