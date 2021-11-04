"""
sorted by starti

range of interval? 0 to inf
lengths can be 0

merge overlapping intervals if necessary
equation for interval merge: if the nsi > si

intervals = [[1,3],[6,9]], newInterval = [2,7]
Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [1,16]
Input: intervals = [[1,3],[6,9]], newInterval = [10,15]


[1,16]

at most you have to merge n times

time: O(n)
space: O(n)
"""
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var inserted: [[Int]] = []
        var merged = newInterval
        var didMerge = false
        for int in intervals {
            if (int[0]...int[1]).contains(merged[0]) || (merged[0]...merged[1]).contains(int[0]) {
                merged = [min(int[0], merged[0]), max(int[1], merged[1])]
            } else {
                if int[0] > merged[1] && !didMerge {
                    inserted.append(merged)
                    didMerge = true
                }
                inserted.append(int)
            }
        }
        if !didMerge {
            inserted.append(merged)
        }
        return inserted
    }
}