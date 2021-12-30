"""

conseq = n, n + 1, n + 2, ...

starting point?
ending point?

1. sort
2. sliding window

[100,4,200,1,3,2] -> [1,2,3,4,100,200]
1 -> 4
2 -> 3
3 -> 2
4 -> 1
100 -> 1
200 -> 1

[1,2,3,5,6,7,8,9] -> 5

group: min

[100,4,200,2,3,1]
1 -> 1
2 -> 2
3 -> 2
4 -> 3
100 -> 100
200 -> 200

4 -> 1
3 -> 1
2 -> 1
1 -> 1

1. set nums[i] as parent
2. for each nums[i], find parent, if exists, compress the path
"""
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var maxCount = 0
        var numSet = Set(nums)
        
        for num in nums {
            if !numSet.contains(num - 1) {
                var count = 1
                var next = num + 1
                
                while numSet.contains(next) {
                    next = next + 1
                    count += 1
                }
                
                maxCount = max(maxCount, count)
            }
        }
        
        return maxCount
    }
}
// class Solution {
//     func longestConsecutive(_ nums: [Int]) -> Int {
//         var s = DisjointSet(nums)
//         var longest = 0
//         for num in nums {
//             let size = s.union(num, num - 1)
//             longest = max(longest, size)
//         }

//         return longest
//     }
// }

class DisjointSet {
    var parent: [Int:Int] = [:]
    var size: [Int:Int] = [:]
    init(_ nums: [Int]) {
        nums.forEach {
            parent[$0] = $0
            size[$0] = 1
        }
    }
    
    func size(_ num: Int) -> Int {
        return size[num]!
    }
    
    func union(_ first: Int, _ second: Int) -> Int {
        let rootFirst = find(first)
        let rootSecond = find(second)
        guard rootFirst != rootSecond, parent[rootSecond] != nil else { return size[rootFirst]! }
        
        if let size1 = size[rootFirst], let size2 = size[rootSecond], size1 < size2 {
            parent[rootFirst] = rootSecond
            size[rootSecond, default: 1] += size1
            return size[rootSecond]!
        } else {
            parent[rootSecond] = rootFirst
            size[rootFirst, default: 1] += size[rootSecond]!
            return size[rootFirst]!
        }
        return 0
    }
    
    func find(_ node: Int) -> Int {
        guard let p = parent[node] else { return node }
        var root = p
        while root != parent[root]! {
            root = parent[root]!
        }
        
        var nodeToCompress = node
        while parent[nodeToCompress] != root {
            let immediateParent = parent[nodeToCompress]
            parent[nodeToCompress] = root
            nodeToCompress = immediateParent!
        }
        return root
    }
    
}