/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */
"""
need to know what each corresponding node is

dictionary [oldnode:newnode]
dict[old node] = new node

1. build deep copy, assign dictionary
2. iterate through original, get copiedRandom = dict[old.random], new.random = copied random

O(n) time, O(n) space
"""
class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else { return nil }
        var dummy = Node(0)
        var copyPrev: Node? = dummy
        var cur: Node? = head
        var dict = [Node:Node]()
        while let old = cur {
            let copy = Node(old.val)
            dict[old] = copy
            copyPrev?.next = copy
            copyPrev = copyPrev?.next
            cur = cur?.next
        }
        cur = head
        var copied = dummy.next
        while let old = cur {
            var copiedRandom: Node?
            if let oldRandom = old.random {
                copiedRandom = dict[oldRandom]
            }
            copied?.random = copiedRandom
            cur = cur?.next
            copied = copied?.next
        }
        return dummy.next
    }
}