"""
x may not be in array
[1]
1. binary search, record prev int looked at
2. two pointers, fanning out, everytime you hit another valid arr[i], k -= 1, stop when k = 0
compare l and r, increment/decrement whichever is closer
"""
class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        if arr.count == 1 { return arr }
        
        // find the first number >= x
        var lo = 0, hi = arr.count - 1
        while lo < hi {
            let m = lo + (hi - lo) / 2
            if arr[m] < x { lo = m + 1
            } else { hi = m
            }
        }
        
        // move `lo` to left (< x) and get candidates ready
        lo -= 1
        
        // move `lo` and `hi` to form the range. `lo` and `hi` are exclusive
        while hi - lo - 1 < k {
            if lo >= 0 && hi < arr.count {
                if arr[lo].isCloser(than: arr[hi], x: x) {
                    lo -= 1
                } else {
                    hi += 1
                }
            } else if lo >= 0 {
                lo -= 1
            } else if hi < arr.count {
                hi += 1
            } else {
                fatalError() // we are told that k <= arr.count
            }
        }
        
        return Array(arr[lo+1..<hi])
    }
}

extension Int {
    func isCloser(than b: Int, x: Int) -> Bool {
        let a = self
        return (abs(a - x) <= abs(b - x))
    }
}
