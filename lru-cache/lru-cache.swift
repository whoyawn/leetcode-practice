/**
get -> O(1)
put -> O(1)
hash map doubly linked list

1    1
2    3
3    4
4    2


policy: when cache is full -> remove LRU
when you look at a new item, then that item if its in the hash map then put to the top
*/
class ListNode: Hashable {
    var key: Int
    var val: Int
    weak var prev: ListNode?
    var next: ListNode?
    
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
    
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(prev?.val ?? 0)
        hasher.combine(next?.val ?? 0)
    } 
}

class LRUCache {
    
    var dict: [Int: ListNode] = [:]
    let capacity: Int
    var head = ListNode(-1, -1)
    var tail = ListNode(-1, -1)

    init(_ capacity: Int) {
        guard capacity > 0 else {
            self.capacity = 1
            return
        }
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    // 1<->2<->3<->4... take 3, connect it to current head, set its prev to null, then at your current spot, bind the left's next to the right and the right's prev to the left
    /**
  x<-1<->2<->3<->4->x
    
    x<3>x
    */
    func get(_ key: Int) -> Int {
        if let mid = dict[key] {
            // set left's and right's
            let l = mid.prev
            let r = mid.next
            l?.next = r
            r?.prev = l
            
            // add floating node to beginning of list
            mid.prev = head
            mid.next = head.next
            head.next?.prev = mid
            head.next = mid
            
            return mid.val
        }
        return -1
    }
    
    /**

    x 1 x
    */
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.val = value
            let l = node.prev
            let r = node.next
            l?.next = r
            r?.prev = l
            
            node.prev = head
            node.next = head.next
            head.next?.prev = node
            head.next = node
        } else {
            if dict.count == capacity {
                dict.removeValue(forKey: tail.prev!.key)
                let l = tail.prev?.prev
                let r = tail
                l?.next = r
                r.prev = l
            }
            let newNode = ListNode(key, value)
            dict[key] = newNode

            newNode.prev = head
            newNode.next = head.next
            head.next?.prev = newNode
            head.next = newNode
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */