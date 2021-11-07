/**
capacity

- doubly linked list
- hashmap
key : key of item
value : node -> val

access -> O(1)
retrieve -> O(1)

head - 6 - 1 - 2 - 4 - 8 - tail

head - tail

get the value:
- bring it to the front -> break the left and right pointers, then add to front

put:
- find node using key
- bring the value to the front
  - if its a new value, add to front
  - if its existing value, bring that to the front
- if youre at capacity, remove that from back


*/
class Node(val key: Int, var v: Int, var next: Node? = null, var prev: Node? = null) {}

class LRUCache(capacity: Int) {
    
    var cache = HashMap<Int, Node>()
    val head = Node(0, 0)
    val tail = Node(0, 0)
    val capacity: Int
    
    init {
        this.capacity = capacity
        head.next = tail
        tail.prev = head
        // h <-> t
    }

    fun get(key: Int): Int {
        val node = cache[key]
        if (node != null) {
            remove(node)
            add(node)
            return node.v
        } else {
            return -1
        }
    }

    fun put(key: Int, value: Int) {
        val node = cache[key]
        if (node != null) {
            node.v = value
            remove(node)
            add(node)
        } else {
            if (cache.size == capacity) {
                val last = tail.prev!!
                remove(last)
                cache.remove(last.key)
            }
            val newNode = Node(key, value)
            add(newNode)
            cache[key] = newNode
        }
    }

    fun remove(m: Node) {
        val l = m.prev
        val r = m.next
        l?.next = r
        r?.prev = l
    }
    
    fun add(m: Node) {
        val l = head
        val r = head.next
        l?.next = m
        m.prev = l
        m.next = r
        r?.prev = m
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * var obj = LRUCache(capacity)
 * var param_1 = obj.get(key)
 * obj.put(key,value)
 */
