"""

[[2,1],[3,4],[3,2]]

[4,3][3,2][2,1]

finding links

beginning/end = number has 1 link only

1. 
{2:[1, 3],
 1: [2],
 3: [4, 3],
 4: [3],
}
2. find end or beg
3. loop and add to arr, if seen before, then ignore
"""
class Solution {
    func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
        var graph: [Int:[Int]] = [:]
        for pair in adjacentPairs {
            graph[pair[0], default: []].append(pair[1])
            graph[pair[1], default: []].append(pair[0])
        }
        var start = graph.first(where: { $1.count == 1 })!.key
        var nums = [start]
        var count = 1
        var seen = Set<Int>(nums)
        while count < adjacentPairs.count + 1 {
            var possibleNumbers = graph[start]
            for route in possibleNumbers! {
                if seen.contains(route) {
                    continue
                }
                nums.append(route)
                seen.insert(route)
                start = route
                count += 1
            }
        }
        return nums
    }
}