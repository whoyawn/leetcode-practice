"""
min num of conference rooms = max overlapping meetings

total meetings if merged

[[0,30],[5,10],[15,20]]

0.............30
   5..10
         15.20


0..................30
   5..10
   5.........18
   5..10
         15.....20
           16....21
            17.18

heap based solution
time: O(nlogn)
space: O(n)
1. add to heap, get max count
2. check beg to end of meetings, if over, then pop until greater

[[13,15],[1,13]]

1...13
    13..15
"""
class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var maxOverlappingMeetings = 0
        var fakeHeap: [Int] = []
        for int in intervals.sorted(by: { $0[0] < $1[0] }) {
            fakeHeap.sort(by: { $1 < $0 })
            while let last = fakeHeap.last, last <= int[0] {
                fakeHeap.removeLast()
            }
            fakeHeap.append(int[1])
            maxOverlappingMeetings = max(maxOverlappingMeetings, fakeHeap.count)
        }
        return maxOverlappingMeetings
    }
}