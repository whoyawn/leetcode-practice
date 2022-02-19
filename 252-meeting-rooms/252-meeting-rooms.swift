"""
     7..10
2..4
item1.end < item2.beg

[[5,8],[6,8]]
5..8
 6.8

5...8
   7...9

2..4
     7..10
"""
class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        let sorted = intervals.sorted(by: { $0[0] < $1[0] })
        var merged: [[Int]] = []
        for interval in sorted {
            if let last = merged.last {
                if last[1] > interval[0] {
                    return false
                }
            }
            merged.append(interval)
        }
        return true
    }
}