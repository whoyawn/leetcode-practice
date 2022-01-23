"""
nums = [1,1,1,2,2,3], k = 2
output: [1,2]

1:3
2:2
3:1

nums = [1,1,1,2,2,2,3], k = 2
output: [1,2]

1:(3,1)
2:3
3:1

O(n)?

heap size k

O(n + klogn)
"""
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var counts: [Int:Int] = [:]
        for num in nums {
            counts[num, default: 0] += 1
        }
        var pairs = counts.map { (Int($0.0), Int($0.1)) }
        pairs.sort(by: { $0.1 < $1.1 })
        var mostFrequent: [Int] = []
        for _ in 0..<k {
            mostFrequent.append(pairs.removeLast().0)
        }
        return mostFrequent
    }
}