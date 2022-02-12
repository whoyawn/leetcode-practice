"""
arr = [-10,-2,3,4,5] k = 2, x = 3 => [3,4]
arr = [-10,-2,3,10,50] k = 2, x = 3 => [3,-2]

 2 3 4 5 6
[1,2,3,4,5] k = 4 x = -1

  1  0 2 3 5
[-2,-1,1,2,4] k = 4 x = -1

x may not be in arr

algo
1. find closest to x O(logn) heap function: closest to x (max heap)
2. find k closest, dq k times
3. return sorted array of k

O(n + klogn)
"""
class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var heap = arr.sorted(by: { abs($0 - x) < abs($1 - x) }) // O(n) for real heapify
        return Array(heap[0..<k]).sorted()
    }
}