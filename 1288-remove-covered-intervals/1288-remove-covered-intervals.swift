"""
1a--3b
1c---4d

2a----8b
 3c--6d

1a   4b
 2c 3d
"""
class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        var merged: [[Int]] = []
        let sorted = intervals.sorted(by: { ($0[0], $1[1]) < ($1[0], $0[1]) })
        print(sorted)
        for interval in sorted {
            if let last = merged.last {
                let a = last[0]
                let b = last[1]
                let (c, d) = (interval[0], interval[1])
                if d <= b {
                    merged.removeLast()
                    merged.append([a, max(b, d)])
                } else {
                    merged.append(interval)
                }
            } else {
                merged.append(interval)
            }
        }
        return merged.count
    }
}
