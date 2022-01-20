
class SnapshotArray {

    var array: [[(Int, Int)]]
    var snapCount = 0
    

    init(_ length: Int) {
        array = Array(repeating: [], count: length)
    }
    // [[(0,2),],[],[],[]]
    //[0,1,[(0,2),(1,8),(6,10)],[3]]
    func set(_ index: Int, _ val: Int) {
        let pair: (Int, Int) = (snapCount, val)
        if array[index].isEmpty || array[index].last?.0 != snapCount {
            array[index].append(pair)
        } else {
            array[index][array[index].count - 1] = pair
        }
    }
    
    func snap() -> Int {
        snapCount += 1
        return snapCount - 1
    }
    //[0,1,[(0,2),(1,8),(6,10)],[3]] // get(2,4)
	// get the highest index less than or equal to snap_id
    func get(_ index: Int, _ snap_id: Int) -> Int {
        let snapshots = array[index]
        var pairAtHighestIndex = (0, 0)
        var (lo, hi, mid) = (0, snapshots.count - 1, 0)
        while lo <= hi {
           mid = (lo + hi) / 2
           let i = snapshots[mid].0
           if snap_id >= i {
               pairAtHighestIndex = (mid, snapshots[mid].1)
               lo = mid + 1
           } else {
               hi = mid - 1
           }
        }
        return pairAtHighestIndex.1
    }
}


/**
 * Your SnapshotArray object will be instantiated and called as such:
 * let obj = SnapshotArray(length)
 * obj.set(index, val)
 * let ret_2: Int = obj.snap()
 * let ret_3: Int = obj.get(index, snap_id)
 */