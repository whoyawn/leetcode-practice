"""
non overlapping = sorted inta intb, inta.end <= intb.start
[[1,2],[2,3],[3,4],[1,3]] -> [[1,2],[1,3],[2,3],[3,4]]

[[0,1],[2,3],[3,4],[1,2]] -> [[0,1],[1,2],[2,3],[3,4]]


[[1,2],[1,2],[1,2]] -> 2

1. sort
2. check valid conditions
4. start pointer, end pointer, make sure start -> end is valid
4.5 move end pointer
5. if invalid , count += 1
6. if valid, start = end

[[1,2],[1,3],[2,3],[3,4]] -> 1

[[1,2],[1,5],[1,5],[3,4]] -> 2

[[1,2],[1,3],[1,3],[3,4]] -> 2

[[1,100],[11,22],[1,11],[2,12]] -> [[1,11],[]]
"""
class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted(by: { $0[0] < $1[0] })
        print(sorted)
        var start = 0
        var count = 0
        for end in 1..<intervals.count {
            if sorted[end][0] < sorted[start][1] {
                count += 1
                start = sorted[end][1] < sorted[start][1] ? end : start
            } else {
                start = end
            }
        }
        return count
    }
}