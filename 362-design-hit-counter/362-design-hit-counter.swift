"""
timestamps unique from 0-300

look past 300 

call get hits at n, look at (n-300,n]
range is static (300)

queue can only hold range at a time

collection is sorted
"""
class HitCounter {
    
    var begin = 0
    var hits: [Int] = []

    init() {
        
    }
    // O(1)
    func hit(_ timestamp: Int) {
        hits.append(timestamp)
    }
    // O(r) where r is range that you move up
    func getHits(_ timestamp: Int) -> Int {
        let newBegin = timestamp - 300 + 1
        while let first = hits.first, first < newBegin {
            hits.removeFirst()
        }
        begin = newBegin
        return hits.count
    }
}

/**
 * Your HitCounter object will be instantiated and called as such:
 * let obj = HitCounter()
 * obj.hit(timestamp)
 * let ret_2: Int = obj.getHits(timestamp)
 */