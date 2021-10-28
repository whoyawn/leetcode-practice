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
find the first node that is higher for each node

answer contains value => don't care about where it is

brute force, for each node, go right until you hit a higher value

O(n^2)
for node in list:
keep going right
put first higher value in an array at i node

inevitable that you loop through each one -> O(n)

last one updated
i node to look at, j potential higher

when i > j, then you can move up


7,6,5,4,4,3,2,1

1,2,3,4,4,5,5,6

decreasing = slow

3 1 2 4-> [4,2,4,0]

9,2,1,6,10 -> [0,6,6,0]

when you hit an increase, then look at stack and compare all the ones you saved up


O(2n) = O(n) time
O(n) space


stack = [(7,1),(5,4)]
ans = [7,0,5,5,0]
"""
class Solution {
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        var answer: [Int] = []
        var stack: [(ListNode, Int)] = []
        var cur = head
        var i = 0
        while cur != nil {
            while let last = stack.last, cur!.val > last.0.val {
                answer[last.1] = cur!.val
                stack.popLast()
            }
            stack.append((cur!, i))
            answer.append(0)
            i += 1
            cur = cur?.next
        }
        return answer
    }
}