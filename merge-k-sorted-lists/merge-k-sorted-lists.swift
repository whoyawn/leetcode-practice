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
[
  2->6->7,
  1->4->5,
  1->1->4,
]

[
  3->6->7,
  1->1->5,
  0->3->4,
]



[1,1,2,3,4,4,5,6,7]

[1,4]
[1,1,3]
compare pointers
move pointer of lower number

for node in lists
    
kn items in lists

heap of k
dequeue -> O(2 log k)
O(nk log k)
space: O(k)

1. define heap, add beginning k nodes
2. while heap is nonempty, 1 dq = 1 next
3. build new list
"""
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var dummy = ListNode(0)
        var tail: ListNode? = dummy
        var heap = FakeHeap()
        for cur in lists {
            if let node = cur {
                heap.insert(node)
            }
        }
        while heap.isNotEmpty {
            let globalMin = heap.dequeue()
            tail?.next = globalMin
            tail = tail?.next
            if let next = globalMin.next {
                heap.insert(next)    
            }
        }
        return dummy.next
    }
}

extension ListNode: Comparable {
    public static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val < rhs.val
    }
    
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }
}

class FakeHeap {
    var arr: [ListNode] = []
    var isNotEmpty: Bool { !arr.isEmpty }
    func insert(_ node: ListNode) {
        arr.append(node)
    }
    func dequeue() -> ListNode {
        arr.sort()
        return arr.removeFirst()
    }
}