class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 0 else { return [] }
        var merged: [[Int]] = []
        let sortedIntervals = intervals.sorted(by: { $0[0] < $1[0] })

        if let first = sortedIntervals.first {
            merged.append(first)
        }
        for i in 1..<sortedIntervals.count {
            let beg1 = merged.last![0]
            let end1 = merged.last![1]
            let beg2 = sortedIntervals[i][0]
            let end2 = sortedIntervals[i][1]
            if end1 >= beg2 {
                merged[merged.count - 1] = [beg1, max(end1, end2)]
            } else {
                merged.append([beg2, end2])
            }
        }
        return merged
    }
}